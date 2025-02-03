Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43440C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 18:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJ4IrrdoD4B8JGKFyiWZtaIfYT4xsJjr7JycVMhHex8=; b=1iq2gJ6y261Oc0bVJlfQIQoJGb
	KRn/kG4tD5MJ4JuKKV4RGUTgyym0icLMjeHa5G2O0IMQ0T+HwTxpTV8TmmqepOuc/r/thGucsfyDM
	QwpZiRCOyIS0ae7PZdC08rAl9E4AMQBqDk4+0pVZvw3GMAR+vlvHiVMEWzvHM+6U5TnOJJ+zp4D46
	7ZD1/tVoqZXDFOO52AWA6mhlXl2PM36ubWCLPt0oG4ESa/9rI6qClBQz4COwQY2mLotVqVk8Dw0Gc
	sybQisa6xOdOlSakGIgfOkd/WMLkskGWq0weEScbl5QPND9ob2EgnKMhvVsWJCEtb8jHSXdm+S2LI
	laQJBQRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1IM-0000000GHkM-2Jg1;
	Mon, 03 Feb 2025 18:35:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1Cu-0000000GGEw-0FGR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 18:30:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 165A5A41ACD;
	Mon,  3 Feb 2025 18:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F289C4CED2;
	Mon,  3 Feb 2025 18:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738607403;
	bh=hfIn6Nqm/wp7zDRzCx0UTbwibJWk73BuSUAvwxU6kT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X46kaLirVYi1oOPQRemFPlg1QxntTBeMtPk5CwqLluRieEt2emoxsOaZDnM8UUWrn
	 gJr7okpzE3lfjRd5Q2HdylVD2Gvfo4aRE7duRZs0xiXiAFq/M60FIG6t6FHW24QOXV
	 3uiI71+WhFgzNeEPW9/CeHAZQhdwZmNnKbv5byGG4lxEPA04Z1NRVqHCvGylfe5Z8M
	 o6rNQSnbucc9DyeGEbfLilrkYlyA5FyJ5YS2BPjPdRT3r2gdBVQWoRPw+NDtV9nhby
	 Znngv084wkcfcsaHC3lqt8JUmDpx39L/B1lWUwDB4TOIB9k/tJemEP/rO5nkip2oL+
	 LI8JvvtvO3vqA==
Date: Mon, 3 Feb 2025 12:30:01 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: git@xilinx.com, monstr@monstr.eu,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, michal.simek@xilinx.com,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: xilinx: Remove desciption for 16550 uart
Message-ID: <173860739995.3355439.1989355900626957984.robh@kernel.org>
References: <cover.1738600116.git.michal.simek@amd.com>
 <d90a839566a56df6a0c3b203f701bd863108d047.1738600116.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d90a839566a56df6a0c3b203f701bd863108d047.1738600116.git.michal.simek@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_103004_158627_46EF82C4 
X-CRM114-Status: UNSURE (   8.10  )
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


On Mon, 03 Feb 2025 17:28:40 +0100, Michal Simek wrote:
> Documentation/devicetree/bindings/serial/8250.yaml already contains
> description for mentined 3 properties that's why remove them from
> xilinx.txt file.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
>  Documentation/devicetree/bindings/xilinx.txt | 10 ----------
>  1 file changed, 10 deletions(-)
> 

Applied, thanks!


