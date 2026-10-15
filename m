Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087A5CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MyqUgRNC8TTLXJOkDSkT/WyzPSUxfkFlEDCnXzm6lfQ=; b=0oahZuqt0SZVuEwi4X1ED/wJXE
	6haswVc3BrMSr1sRtwH16VLgSaZlC8fvFrE8wNzA3eTuRU6hpaRyucOKVLTpX787W5sExsfDa9Bkw
	+/LXQLF2fZ1ZbX10yliIOWXzBqSwLcY1wtPbdKb6xK01QLviQZlACLQn3Q1NGNBxzYIwjQhFio2zZ
	W5SRk8A+xWYN1I1XQW4VwptNdo7NeXhEHVlmwSCHGusCYVsapf6QIKsFeCHEu9eJdmKogWj/efsfg
	SgAkCVID8Vw6Uf9sIbjLPpTjhlNZI9EVbn9EptriN0h/fonsI7Y3ByA78PRg7UdUEy8oy4A/HiwNe
	KJQ9Oelg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRl3-00000001Huo-3Zm8;
	Thu, 15 Oct 2026 20:08:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRl3-00000001Hug-0cwO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:08:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 28B1D6021E;
	Thu, 15 Oct 2026 20:08:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87EDA1F000C4;
	Thu, 15 Oct 2026 20:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792094935;
	bh=MyqUgRNC8TTLXJOkDSkT/WyzPSUxfkFlEDCnXzm6lfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=le80fortspeqftGamzmiSMSuo0PkgBlXQzfv60zEfh5BTVudPeOsoL34qGK/Awi5z
	 8PHxOyyOd0lE5OmXoYU4Tlbw7jVEtrfhcspbHmyyJoItMbutaypYv/XpgzGX2/YYRI
	 bC3n//oLHsMBfiXwIkpGAknmWg7wUVL0Q9kwRf3liVQp0pf9NfYO47BXOm2DTwBnM2
	 0OWxO3s8kmGAYfZdyC/kJg/cMmqXnvpVix7knIVBZ8DZyXCXb7YbeDjXzqALnOy2kD
	 E4oBnTfqgMXOPsBbNhfJeZh5jHcFupu74hX7KhxC6AzUcRRHKfkgOK4boLwLXGRNUa
	 NgXrjyGJzMHnw==
Date: Thu, 15 Oct 2026 15:08:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	devicetree@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev
Subject: Re: [PATCH v5 1/3] dt-bindings: remoteproc: imx_rproc: document
 memory-region-names to avoid hidden ABI
Message-ID: <179209493314.2837720.2349962210068858296.robh@kernel.org>
References: <20261015-memory-region-name-v5-0-abc358b39a96@nxp.com>
 <20261015-memory-region-name-v5-1-abc358b39a96@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-memory-region-name-v5-1-abc358b39a96@nxp.com>
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


On Thu, 15 Oct 2026 10:39:22 -0400, Frank.Li@oss.nxp.com wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Document the optional memory-region-names property.
> 
> The driver currently derives the memory region type from the referenced
> memory node name, creating a hidden DT ABI. Since memory node names are
> not constrained by the binding, incorrect names can silently pass DT
> validation, as seen in examples using "vdevbuffer" instead of
> "vdev0buffer" ([1] and [2]).
> 
> Add memory-region-names to explicitly identify the expected memory regions
> and avoid relying on memory node names as ABI.
> 
> Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
> Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Use optional property to keep back compatible with old platform.
> New platform should use memory-region-names.
> ---
>  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


