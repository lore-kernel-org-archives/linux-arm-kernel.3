Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24531CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 20:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8A73wV015tkvvGKY5EgOERlU2AchZah+HiZfjnJj2I=; b=fiBAzK2uw89HBxcJ22X4D1WI9O
	JCY1sMWAPlnV+8XOhZXJ3md0Y3QnKBKExNdvKX8KHnHpgqlqRp0HveO1YudpViKNDt1rE4sCRBoDS
	ySskBLgVRndj04g5tTs4sYDIxyQx9nPL8E0gnXAG/cMtljhFWVwHYLEywEgCZshR/pnj/QZdKzTDo
	Jb9jOFX0iN8vBNqIIkMxXSpgs7nBcpcjbrK0R44/f5drDHPry6JiRJFxhOCj09LyLj76FjE55uOcm
	QJaGggszaKJsFd0xRIuiYnFH9SBDtv5J7j8DuCPM/EHaLf0d9+PSAkJYlemTe1lOaOnHi+AWyG/Vt
	iEf3LgMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwRqJ-0000000GisH-17K9;
	Wed, 10 Sep 2025 20:55:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwRqG-0000000GiqD-2YMb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 20:55:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6742B43FE9;
	Wed, 10 Sep 2025 20:54:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 177DCC4CEEB;
	Wed, 10 Sep 2025 20:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757537699;
	bh=Qt4PUFPPCFSZ3ZqUW7GmrUb9XiUfrOy8Dqd9Igot5XY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ze8vB2GrHYd3P0VbAM4Iwcxw7X1Qci9aYtDWoc7BtyMTVGTXs1ifku7cr9vCN1q/V
	 fMah2SMryKMzso8jQyaSIMu/Fgae6bEd0XF9Dp5Ba5sfh82CkT/bwCzx/2Y7xyUw16
	 prHhJrNdv3qxnifunhYrPgFA+l0ENLxCRvH1MwgQvQPEyzVEhAdBAsi5G2E2I6zqXI
	 36bXTikeCl47xEp8rbru5e6bRE3bYltk3OPweQ4yd5Z5F+u4MHJOuuBKWbo+GVvgNc
	 n2ZFsGrx/qkGQeLV8NvwCb+XvJiiMIU//BKdMJSmWfiR2SvzeV05N9JikiBvv13tXJ
	 U5IttfR9x3Gkw==
Date: Wed, 10 Sep 2025 15:54:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Scott Branden <sbranden@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mailbox: Convert brcm,iproc-pdc-mbox to DT
 schema
Message-ID: <175753769640.397014.8461957797361840700.robh@kernel.org>
References: <20250812181406.65390-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812181406.65390-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_135500_663947_5289B9A7 
X-CRM114-Status: GOOD (  10.40  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Tue, 12 Aug 2025 13:14:04 -0500, Rob Herring (Arm) wrote:
> Convert the Broadcom iProc PDC mailbox binding to DT schema format. It's
> a straightforward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/mailbox/brcm,iproc-pdc-mbox.txt  | 25 -------
>  .../bindings/mailbox/brcm,iproc-pdc-mbox.yaml | 66 +++++++++++++++++++
>  2 files changed, 66 insertions(+), 25 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt
>  create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.yaml
> 

Applied, thanks!


