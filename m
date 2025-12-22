Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE2CE6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 09:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=reDamkF5nEXFaFLCWDgByap5c19pqDA/RDfTje1bSjY=; b=PioWMuP5Vmhea4PAM2NpDggG/K
	xVwOIFtom3yU5Gjjp/LwJT8OASgDSm9+iaksKlty+Xiay3pQM6HrhS9YHmES2fNCskY2wh2pMQ+wW
	r4X4k9QGoCnOy51GlA+mvlSnpVXoK2vczS3UdxohsTaHrxtIj8uUq6JReC+ejJsCZUmhz7rlhCmwh
	nNdVzDegU2+f4/Y4gF/OH/cvjcFSm9/FBaPC9yA2jdnLvBWI0wxtxS7eCobIMx+5vQ3rF9K5/PeHK
	gfGhO+Gh+TbtBxvyHRnwXUwlog337hNpbsPAp8VFut1jvFXnG3cHRR6NACKBG7vT69BL5ezHdYJdw
	soLpEOLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbun-0000000DVEc-0Tf3;
	Mon, 22 Dec 2025 09:09:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbuj-0000000DVEA-1XGH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 09:09:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 97D7544244;
	Mon, 22 Dec 2025 09:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 981CDC4CEF1;
	Mon, 22 Dec 2025 09:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766394552;
	bh=dPA58icEyl1d1Y7YNyGO4sB5sX1GTGyKNMTI6sWHddQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qt30uHvUOqOKmrFaZsHXSxR7WqZkFYcq6JqlNlxnG2w/XWtFACiJBfp/76nf1OcUY
	 QIy9bmQnwDxJkcD+OETOzNTiaqwljx82r2Cas/Kl3wf/z9iigyH8Np4YfU0Tp0XMRy
	 j/o7DBkziUUMApKOt+bydQbK5owl8TiivJ2yuttsrCUgE0nQhWci5zRymtjtqfmOS7
	 HRgGZvizUYA+XbggJWUeTRH2EAtarMxRzamlpubmbrDOwVi/jvMIobsF4RDq6jaZEe
	 WgsC1Ca4u3i3Wevuzayglg2eYxBTgLmjIMinkDDugny+ix7qwjANjW+UeoVAQr4lU4
	 VSwSxGG+zNb5w==
Date: Mon, 22 Dec 2025 10:09:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Harini T <harini.t@amd.com>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, michal.simek@amd.com, shubhrajyoti.datta@amd.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	git@amd.com
Subject: Re: [PATCH] dt-bindings: mailbox: xlnx,zynqmp-ipi-mailbox: Document
 msg region requirement
Message-ID: <20251222-funny-aspiring-seal-05c4ae@quoll>
References: <20251222044653.1757886-1-harini.t@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251222044653.1757886-1-harini.t@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_010913_583967_1750CCE5 
X-CRM114-Status: GOOD (  13.57  )
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

On Mon, Dec 22, 2025 at 10:16:53AM +0530, Harini T wrote:
> Add description clarifying that for Versal IPI mailboxes, both host and
> remote agents must have the "msg" register region defined for successful
> message passing. Without both, only notification-based communication
> works.
> 
> Signed-off-by: Harini T <harini.t@amd.com>
> ---
>  .../bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml           | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml
> index 04d6473d666f..8fdf77c7935c 100644
> --- a/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml
> @@ -165,6 +165,12 @@ allOf:
>          reg-names: false
>  
>      else:
> +      description:

Else block cannot have description.

> +        For Versal IPI mailboxes, the "msg" register region is optional.

So it is optional...

> +        However, for successful message passing via mailbox, both the host IPI

And it is not optional. If nothing works, then it is not optional.

And why would it be optional in the first place? You generate your same
IP with different settings?

Best regards,
Krzysztof


