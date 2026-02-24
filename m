Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4301EFB80E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 07:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1sKuDgot7I4GOx5EWcg0U/E5ZJktWKrw37TouVBOS68=; b=d2MHe1de2e7SykfCrDGm1A6ICX
	F1AoWMiwKgaMTYEl8wb/Dmj+aAcwaIrA2VaDjJApqTSJM8FrVYYRXpbtbzpldYZ+QjVLQW6JGwoxc
	gJdW2QXuYy9BMjMxsoJq0RImwA6tTkroBEFBEDaQZEZwkqXpLcAqcWyK1734Pp3M6rEUtYEfpi3ti
	u/cbbn94rt1ann5DvwJZZPbFXK9nA5bNV3hA6+TBFNgBaEN2O8EzNQX5QMEepv03UjgfW5sV2SgfP
	EgGlAdgq1Y3FUeuL+WHAotb/YyXVIAHpZBime+SxpU8TwP96ToWpFtFFLKQc/3nTmN/awhaVy6IJQ
	KCNC1MhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vumWS-00000001Ynj-2aB3;
	Tue, 24 Feb 2026 07:07:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vumWP-00000001YnK-3Z7y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 07:07:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 61F6B416E3;
	Tue, 24 Feb 2026 07:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E5DC116D0;
	Tue, 24 Feb 2026 07:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771916873;
	bh=hHcyq/uvklfIp0Y5DZyNfWw9A4+Llx6RoaYL0waqnm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l5Gx85a2Dkl1xNL/peu5+mEiIidCDKoxthwZjziZNEW5wXlHK0sFejRSQgI6T+6BR
	 acAKxbWlo9665jpbZ+f05s/2d0BZnkK9W75jYGH7pOGiMvJwWAGRvxhvgkNyUvneUx
	 wKOdlyoKtYzAlgIUCIpC/9z8N4gBbIGNZhhrqFC7nZLvJUK7VDERv2FqyrBtIaCapA
	 0BCSMAcW8RHB+Mj+CqFo6ZFpHIxv12vHHdhXazuVcvvEz2S70p8OA/vL4o9XcJJa15
	 Fi7VPIsrvSjxA48qoPmOXpX1o3j5a7HsI5vX+KqNx9Zw30I4uw2AznKJ/Mh1HiGVsl
	 2ZYAgjudV2EMQ==
Date: Tue, 24 Feb 2026 08:07:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, baolin.wang@linux.alibaba.com, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock
 support
Message-ID: <20260224-innocent-fluorescent-caribou-be5bba@quoll>
References: <20260224014758.2660318-1-kamal.dasu@broadcom.com>
 <20260224014758.2660318-2-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260224014758.2660318-2-kamal.dasu@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_230753_915822_FD8E4827 
X-CRM114-Status: GOOD (  15.30  )
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

On Mon, Feb 23, 2026 at 08:47:56PM -0500, Kamal Dasu wrote:
> The Broadcom settop SoCs have hardware semaphores as part of the
> "sundry" IP block which has other controls that do not belong anywhere
> else e.g. pin/mux controls, SoC identification, drive strength, reset
> controls, and other misc bits are part of this block.
> 
> Adding brcmstb-hwspinlock bindings which allows the hwspinlock driver
> to iomap only the 16 hardware semaphore registers that are part of all
> settop SoCs. The semaphore registers are based on the BCM7038 SoC
> where they were first introduced in settop chips.
> 
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> ---
>  .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
> new file mode 100644
> index 000000000000..416d8d2948af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml

Now filename does not match the compatible. You must always CHANGE ALL
places, compatible, ID and filename. Please read writing-bindings
document.

Best regards,
Krzysztof


