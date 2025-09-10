Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F6CCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 20:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lE/Ei2l32h4rN0NMBDBLTs6iw1HsEV8uHzTfH4HsPPM=; b=jURUy1gDRVVvkG/+1tNLqJa3I6
	6dIWH2qWFxvRpWTCEH5O8eoUetd0LZDX8TOCaKNu2pLCAHQeU0HG42KdYj/NVTk8YQGfXyc5ao/h/
	a5BzH6GVkxrIqdIArqt1qNs7WogIs+iGU+m09UjC9tXkrQR3bPOT35iaxaD8TiIXGHUfQbzvrcRpj
	18Xwh3O/y8tnRSSDHFiDe175YZxVTwZ3mMHP8fqdB149tJdzmSSOCSh8ntNrZfcpj7DcboB3ldZII
	WA63nQsXU8D/okhw2AXbLWO0WE8l5Gc/tIDW0d0ahvSTNwwtljmT0d/70aLroSSdNrG0tBJMxqIIs
	kr+0Qd2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwRqR-0000000Giyr-2uz2;
	Wed, 10 Sep 2025 20:55:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwRqO-0000000GiwV-2ep1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 20:55:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F7B2403D3;
	Wed, 10 Sep 2025 20:55:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10B4DC4CEEB;
	Wed, 10 Sep 2025 20:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757537708;
	bh=f6q6x2tp7XQqttUmi2HUrOte+WCgdNBRYOWvEA+0dXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EwGSBCjNw8EvxRE/u13lIZTcQ9hKCEMMzvlbBvpSH8oeDo/rK4gPzb6F5CHixVYvg
	 hS01zeh2hR2cgLcWa5DwDfcuZNYT2z+/HFMNSt8VmCn1GiyPCqMa+ACiETYbHCm/vM
	 84fNFVLItZPtWGuytLeZAeqMWMa2LMMB6gRenMd6oj7mPwFEZ0QseCbHj8MVg/8Tc4
	 YhhWApsLG+CEZnT6Ie2Y4xrKuM99E5K5+0kTpjqY/m6i7+EbmIe2U0QMwhLfNK0Y6f
	 bW8o7Kc+NsEBo8skviTIM+xh7Bs3HPWaYWj/x90AWis9PZf35fnnF6U2rVerFZFKIx
	 dpYobsUR6lUSA==
Date: Wed, 10 Sep 2025 15:55:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	Scott Branden <sbranden@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: mailbox: Convert brcm,iproc-flexrm-mbox to
 DT schema
Message-ID: <175753770657.398619.12206824436834292198.robh@kernel.org>
References: <20250812181415.66923-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812181415.66923-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_135508_691502_47039FED 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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


On Tue, 12 Aug 2025 13:14:13 -0500, Rob Herring (Arm) wrote:
> Convert the Broadcom FlexRM Ring Manager binding to DT schema format.
> It's a straightforward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../mailbox/brcm,iproc-flexrm-mbox.txt        | 59 -----------------
>  .../mailbox/brcm,iproc-flexrm-mbox.yaml       | 63 +++++++++++++++++++
>  2 files changed, 63 insertions(+), 59 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mailbox/brcm,iproc-flexrm-mbox.txt
>  create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,iproc-flexrm-mbox.yaml
> 

Applied, thanks!


