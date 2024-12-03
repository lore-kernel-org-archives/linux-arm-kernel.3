Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A15E74AC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 17:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VweZ8YjWZ78Zyn1hhkEyQiyT2MqJ5xoTwegnXNsv6lw=; b=PgsGQ1HI03lC/E0hG036S+60fm
	0t1aR5LbTyZNbLQbbbE9efn2dzp/MXd8tQbwKp4y3r27mONwis+31wshLqfP73z9vSqzbrHHWTaII
	CuqfAyXnLFTd+RmN8UBCyP8LAhWRhQHX+OnCQ7HrS+BOG4A7NY1sIqNRSbjYfRZj+edaIR47kHgfM
	gvJ386AAYYU06FmCizEUM8RjedlWlLiRt+aGn1Y5qAdb25GsMzmx0Hl7l+ZHrtDWED3mNjQmp8rMO
	LvV5DeO5zPTZ2R5MHEVyEMflABE9iCwvuN1Iz09rx6j6jjozy2GcWvSUl8JJEttCjpDiXbyob6+0U
	9Hb5RG+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIXAk-0000000AJyn-1jXc;
	Tue, 03 Dec 2024 17:58:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIW6F-0000000A9e1-01q2;
	Tue, 03 Dec 2024 16:50:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EE490A417D6;
	Tue,  3 Dec 2024 16:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE083C4CECF;
	Tue,  3 Dec 2024 16:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733244609;
	bh=hl4qjq6wBEq5/6rBW02XlLyDQNXhu4x9H//HnoHXZC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kyW7aAvfsRsd+goXqPtxbrF2GZ9SUIgO8a/u1AJ8BIEnmbS5M3rvY8PwauYRqY69E
	 wMH5EFRYngFm5G+VV1tipxqdIFc41sJlBO0qh3qPCzE4sbfpkOA5o2Vyiy1qWqgIFB
	 tDM8h/jaa0EONYCKZBgvbq7BzhmLostW8/EjWPzgZMtsAzVQxFUDMqN0NCdgm9ZDLg
	 4fb6XRDcTbDHRJQdleIIvXoILAqO8mFQ9vF1/QKq2tdmUJNpeYz4vXfsC5H4pgkF5H
	 yXF+ZFN/xAJAxY7eBbV6DIDQiMKdXO9IDBGv7yUgvqUy0TKwnw3Vi60mUCL2qMjhMk
	 nZROfofiKrMYw==
Date: Tue, 3 Dec 2024 10:50:07 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org,
	airlied@gmail.com, mripard@kernel.org, devicetree@vger.kernel.org,
	ck.hu@mediatek.com, linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
	dri-devel@lists.freedesktop.org, kernel@collabora.com,
	tzimmermann@suse.de, krzk+dt@kernel.org
Subject: Re: [PATCH v1 1/7] dt-bindings: display: mediatek: Add binding for
 HDMIv2 DDC
Message-ID: <173324460711.1946104.15731375026648249870.robh@kernel.org>
References: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
 <20241120124512.134278-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120124512.134278-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_085011_103625_5A61C0D9 
X-CRM114-Status: UNSURE (   8.25  )
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


On Wed, 20 Nov 2024 13:45:06 +0100, AngeloGioacchino Del Regno wrote:
> Add a binding for the Display Data Channel (DDC) IP in MediaTek
> SoCs with version 2 HDMI TX IP.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek/mediatek,mt8195-hdmi-ddc.yaml    | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


