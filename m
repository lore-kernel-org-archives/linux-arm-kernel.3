Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5998DCAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 14:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlHLkEbSJhpN8X8CBqIKJC8pNsm9nxHoaFK6d+v92AY=; b=vbjP7Cv4vRNmYnnxVWxbdsXrdr
	w+0TqKDd842TpW/pdtHoCEh7OmemBB4LxBauAz+KN6QirwkDYSQbEgmq6Vj3/PHJtf/jjPpklYnnf
	+NCKSoHOgDvavw4/E8PtORQib/I3DPM+Q6ZZu2XOXKxI5nvvMKfZXzpO8Ssd9IJO2+QPIgPiFFT9+
	rJulPDyjrlPZqenUnHihJMah7zibBWBuje8EGMOYz9szXuhvK8dS5WdG/0wUNdVb0gWDENr1R7V0f
	kvNMlfPo1sW4oOsiB/Na04Sw29Xr2eRhiHnUG521nFhfH3nuTL6idMwYFEK/y/akUttYQgm/D9e/G
	oSKsyeeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29rM-00000002Bg2-1YB1;
	Fri, 26 Sep 2025 14:55:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29rK-00000002BfW-14mm;
	Fri, 26 Sep 2025 14:55:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AFEE6403A3;
	Fri, 26 Sep 2025 14:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7740BC4CEF4;
	Fri, 26 Sep 2025 14:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758898541;
	bh=8gj65qVHmn8vegx9eirL41njLH2RQUiHZwCiJ5RZXJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VsIMOILFvZt3zXiMnd+saoKFhSWh5zztX+Vkpu8GCGi2SCm9njFLFhSnDPSmZNwfv
	 SYleGKAfg2B6nSMO8jJOkRwZp/YHbS3Dr++PLIQK9xXPglOmsI0R5WQNP2dlWAPC4M
	 CeYuH+O4NbFWXni5LxPXR2/gc+hdGL1MGw2FeR0+dBAJxE0z96ICowzveFhLAzoCCQ
	 caFPk/ln35737kfe6I5VenX7KEpnjhPImpeJLdZsFbaPNnPu1+BwId6SjWg1PLHdN6
	 XmdlDWwHpw9tCsGkQIr52V/rybBVS936X3o7QcSxbt5TXrYmxM61F4u9YpWu1twaIP
	 71oqhq8XgRDeg==
Date: Fri, 26 Sep 2025 09:55:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org,
	John Crispin <john@phrozen.org>, linux-mediatek@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Felix Fietkau <nbd@nbd.name>, Conor Dooley <conor+dt@kernel.org>,
	linux-crypto@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v3 3/4] dt-bindings: arm64: dts: airoha: Add AN7583
 compatible
Message-ID: <175889851158.762885.9694825397072529711.robh@kernel.org>
References: <20250925164038.13987-1-ansuelsmth@gmail.com>
 <20250925164038.13987-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925164038.13987-4-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_075542_315541_60AAA518 
X-CRM114-Status: GOOD (  11.83  )
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


On Thu, 25 Sep 2025 18:40:36 +0200, Christian Marangi wrote:
> Add Airoha AN7583 compatible to the list of enum for Airoha Supported
> SoCs.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/airoha.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Acked-by: Rob Herring (Arm) <robh@kernel.org>




