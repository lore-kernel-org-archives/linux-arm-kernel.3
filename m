Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA363C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 06:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GrxB0otAQBY6ovXkbbAgK9iW9B0zvK0R1w731XDGAnM=; b=T92On6aLeQUh2s6tNpv0RmzCOc
	EG8VjI0ZWkH3794M/jK7+dDigSp2ETuS4FHERgfxjZm/P/4teWk9vhFOYD50R1teDHveLJw5kiNLi
	mpw2jEvHU4TaxFKyvOhdroG5NoZ2nvwlVfo6CJTeiCvxERKnrJRNHUd/wNzHxeNR0yG1Eod+1QaG7
	oE50owde4fMyZ1msKpc5GR5Xzm1lYS7zW37q9R9A6o/RLdOGpvPZHry1undi9RAxSBlQtQPwJyfbm
	0MW+GUaZsHTGPStByjSOUlnCIkDaFmC7BkmGDL4s9HO+lEWUN1vB3RMCcTR8M6n0WWZRFmSwI35vF
	OjD4wanA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtg1x-0000000DQUv-2SCj;
	Tue, 11 Aug 2026 06:32:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtg1w-0000000DQUV-1J35
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 06:32:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 89F04600AA;
	Tue, 11 Aug 2026 06:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A651F000E9;
	Tue, 11 Aug 2026 06:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786429927;
	bh=GrxB0otAQBY6ovXkbbAgK9iW9B0zvK0R1w731XDGAnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n5U7Criu0cMqflxnnpV0TdIDv+m+9uk6645yRPN6yuwZp1q2xPLJE5cSQOPsOj7RJ
	 lyZ0DYJxDN5/qItnaUgRJI5vze8sJFgl0SYY7p19z274Xo4jjIJgvg+vjPBq3EVIAq
	 83YCHrLRzxOsmS8fpFhnIeCgSzRCnmb4h0iusPsVBN4L/uQDzDLeaDs/g1WHgSrSWw
	 puPwiu5A9VAFvJ6LchFz6CfYEw9rhISobPQ/EIO/fzUbp/v0TsWiAc9Zig2NadkSfk
	 OtpD+mdAtvtEBYbm+shFCnZnvGCdAQjx7GJf1pByLPAXZqKxKfgseeY2K0i+hsP8rG
	 7Sx8q417h/62A==
Date: Tue, 11 Aug 2026 08:32:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Cc: peter.ujfalusi@gmail.com, vigneshr@ti.com, vkoul@kernel.org, 
	Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nm@ti.com, ssantosh@kernel.org, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, r-sharma3@ti.com, gehariprasath@ti.com
Subject: Re: [PATCH v8 13/19] dt-bindings: dma: ti: Add K3 BCDMA V2
Message-ID: <20260811-exuberant-cobalt-cow-4d5287@quoll>
References: <20260810151423.1948224-1-s-adivi@ti.com>
 <20260810151423.1948224-14-s-adivi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810151423.1948224-14-s-adivi@ti.com>
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

On Mon, Aug 10, 2026 at 08:44:07PM +0530, Sai Sree Kartheek Adivi wrote:
> New binding document for Texas Instruments K3 Block Copy DMA (BCDMA) V2.
> 
> BCDMA V2 is introduced as part of AM62L.
> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>

Please explain dropping tag. I could not find a reason for that in cover
letter.

Dropping this from patchwork.

Best regards,
Krzysztof


