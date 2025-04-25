Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B595C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 07:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9HrZFO1HxNr7QRxatCzwBsppi3S6g+ZtyVTT/8xLLU=; b=yBatLoPYvdASVexSp5sKqkHOka
	RtGAbPz6qLOFT0Ajt0MBAuuRhoEV7N8HVpITavAkwxN505LbHU+kc5dPjEK+zIsWGnqz62DlnhUje
	wtDEbGaDVZOsKOAplmVj4UFHXeGOMs2XJzcRevuBwmpP6KYgYAUafs5Nvw+MTLk11phY7FeMxqrB1
	P+f51rJ37Z6Vrv4/IN02VXPVXnzUcE1Dhz3nM6rCNbiU+MyvBDI0+aMCWmfukS8kr9R6ICL3QvqE+
	CNPWXRZM33zi/cCwgfTnqfgRC3Zx4sO9vdgTLdQ1moR9OSr5INN5PbR8L5AjfGL1mpbmGWQVviwmZ
	ZMdoK5nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Dvs-0000000GFsC-02j2;
	Fri, 25 Apr 2025 07:57:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8DtT-0000000GFZs-3t7v;
	Fri, 25 Apr 2025 07:54:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8DE804A6BD;
	Fri, 25 Apr 2025 07:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84915C4CEE4;
	Fri, 25 Apr 2025 07:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745567683;
	bh=+Z/GyLY7Y0/ktHgQwu1MvZ+wAxDQGzn307sCugv0wxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TrOgN343F+8SvyBmASs+qd9cxKwkB6TgRYosaXb8+pF/IGRpgBPVVQ/imvii900h1
	 k5sBXWkvNthiWQCZ6HeA2D3l8dqWAzWSoYOKPQXW36tEIlwpJO22fQenc+/jZ5o9uj
	 bL1DdTUZpvZ0i+Yl7Na/b7+LWMnqvyOlUqSz0HDn2PPnnymVXfasj42XEzmzJEusgz
	 5ZzILkSqbtyYBb97qb1zeuKOzG8ie4vVU0b/HiM6rhjlaBt09as4rcLHLlGnWPBjC/
	 bOK0yX+9s9RViVuI8+ubKwg2vV3xifIBHbSQURNFH5e3qlN03P5YDTTefcXGPrDuwu
	 qEwOUf16GHYPQ==
Date: Fri, 25 Apr 2025 09:54:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, John Cox <john.cox@raspberrypi.com>, 
	Dom Cobley <dom@raspberrypi.com>, review list <kernel-list@raspberrypi.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/5] media: dt-bindings: media: Add binding for the
 Raspberry Pi HEVC decoder
Message-ID: <20250425-grinning-potoo-from-mars-bad749@kuoka>
References: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
 <20250423-media-rpi-hevc-dec-v3-3-8fd3fad1d6fb@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250423-media-rpi-hevc-dec-v3-3-8fd3fad1d6fb@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_005443_983617_46375E9E 
X-CRM114-Status: UNSURE (   7.78  )
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

On Wed, Apr 23, 2025 at 06:20:20PM GMT, Dave Stevenson wrote:
> Adds a binding for the HEVC decoder found on the BCM2711 / Raspberry Pi 4,
> and BCM2712 / Raspberry Pi 5.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Also:
subject: only one media prefix. You really do not need two prefixes.

See DT submitting patches.

Best regards,
Krzysztof


