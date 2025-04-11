Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E578AC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 14:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0ajtStdPiOgsbj/fwGEYhVGQT3GE+3ol5ucX95pd7M=; b=rZpNAqoHY7Hn/S9aKb4uYAUAbO
	AsWG1VfH2AcD37g91E8CGy8qwJ4eo5UlwmpmwoRjmUHeozfBMg2h926ccFRVVa2ceV1Zob/xWG15O
	3dsu5BPBCcoFVBUHjeRP6Vbx4lt/148gABUYj2IdSnSPRGK/kfJ5S7ojjvwcYxWjPOeZFVfQuNNbo
	+30DM+fTqJNCeiBd8PTY8uHX4b30W931L/U7k2c5ZPAUMtm7PELCzuL1jLu8oCcaSNYxm8TjskCld
	BgcHPNf35OPUC2AngoBHXZ6ALNrOBR5giy2SUstRdXx465+nBio5cCDSgrclx+dK9eJcNJ4Z52d7/
	o4IhtJDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3FMQ-0000000E5Xm-1npL;
	Fri, 11 Apr 2025 14:28:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3F3U-0000000E2AU-13cM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 14:08:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1568D4498D;
	Fri, 11 Apr 2025 14:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CFFCC4CEE2;
	Fri, 11 Apr 2025 14:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744380507;
	bh=nX4DIF7APuUGgpi+dZMGrR759kRdWLm5IwHTBTnZ7RU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KBQ+xdRxaUn4XSDExJwykf3BFFD6Qlfpa3CFVwRdFM6TTnqPMuea3fZE0FmT7AYfi
	 bGkZy0iJCwbJ6JVJRq6ibhfYCvfghtDe+1D6zH0UyPTya1i7Z8Dd2MesZuo5lm47G5
	 JpbojT0p392yV/vLSfM154vKVdz+ztKAVRP/qwreaGwftZzj8A9w96vGpBduPRBr5P
	 zeTUiJAWiTFq0tzSH+ZeWt9WGTG4MpAdrwmDLEPntO1Bu7uapknv4KlArPY51j4Mmf
	 at5QSa9W6okkRTHJFK/NFUTBHIDUdxOz6IRZGVbmy8xcyXwmU1OzswkprUAjjsM7kz
	 hCDYkWFq7a0kg==
Date: Fri, 11 Apr 2025 09:08:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: samsung: document g0s board
 binding
Message-ID: <174438050588.3113760.16761182166000834243.robh@kernel.org>
References: <20250321145556.1436201-1-ivo.ivanov.ivanov1@gmail.com>
 <20250321145556.1436201-2-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321145556.1436201-2-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_070828_308831_913F0E6E 
X-CRM114-Status: UNSURE (   9.12  )
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


On Fri, 21 Mar 2025 16:55:53 +0200, Ivaylo Ivanov wrote:
> Add binding for the Samsung Galaxy S22+ (SM-S906B) board, codenamed G0S,
> which is based on the Samsung Exynos2200 SoC.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


