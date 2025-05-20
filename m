Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2C9C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 10:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmDf8dgPq2ihMkZOT9kozyD48n/2NB/al1NuUIt7HPo=; b=X0Fov9J2WJ+61Un+fa+ZIMwm/O
	epFexUOhNSc8SbwAWXEM0Djc/L6NwaU/6e3DuoANnfcLCwbwOUS4kbc7kbSP0sSzHMV3byXDc9nhJ
	QNh2MV3TYS6FKDmLRTW7uliotiZW0G0jn9Rxl7HudrICoVWZTTOA9kg2EcpvCuGpYy40nQSrc9/W8
	hXN7X+FS/lf549HEPqL3EYRGOsbYN3ya4IkWWMRl8dK44cJR5ULFVzRBc3bTesUqXq8kiAaiL05Uu
	hSQd7bbUVMDBOZKA89gLlGdUb33UNiH0q9kf57qOwovyU8+Mpa9MEB6jIdsLkMhfPQ2VBsWFSsFpT
	2X1JtJ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHKOW-0000000CP47-16gB;
	Tue, 20 May 2025 10:40:24 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHKAN-0000000CKsf-04lJ;
	Tue, 20 May 2025 10:25:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747736745;
	bh=TAEOQvbzZejm7YyxqI096TZatZJmHDMuFPXOIy2uu7E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LlUv5ZTHvfYzBYBf20gv/d92kW3WgpupVE/JmMtpXqlLOkigEN1zGg8FNEo9nwdYr
	 qJUjALBEajB59/Pz2rvRAUSow6S7gZKN/rePyJ8FcVLaomg8uVPz8ZguJqdXU8FuuY
	 Hhl6YPXR4WePrjxjpJl3Dq06Hys2s9uoLgXbqBbcaoqIL1RfEh4KuqyJoT/L+0huet
	 1aHcgOb/FGOWiJhIYAmCtrS85/V9/E3/4Z20QxIUMkLozmpb4ctJPEVshNnJr3Nl3A
	 LPODYBtpEG0DAFKwbSfoSP1Dl9gVG4uk9c3dqGYuz55VObYT7LrOj5N+k4Q5gpcdT1
	 AdDrFpWvv7feQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EB81517E0256;
	Tue, 20 May 2025 12:25:44 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250515-mt8365-evk-enable-touchscreen-v1-1-7ba3c87b2a71@collabora.com>
References: <20250515-mt8365-evk-enable-touchscreen-v1-1-7ba3c87b2a71@collabora.com>
Subject: Re: [PATCH] arm64: dts: mt8365-evk: Add goodix touchscreen support
Message-Id: <174773674488.3414755.9299343068235578994.b4-ty@collabora.com>
Date: Tue, 20 May 2025 12:25:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_032547_216448_2E66F911 
X-CRM114-Status: UNSURE (   8.28  )
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

On Thu, 15 May 2025 12:04:11 +0200, Louis-Alexis Eyraud wrote:
> The Mediatek Genio 350-EVK board has on the DSI0 connector a StarTek
> KD070FHFID015 display panel that uses a Goodix GT9271 I2C capacitive
> touch controller.
> 
> The mt8365-evk devicetree already have the display panel support but
> lacks the touchscreen support, so add it.
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: dts: mt8365-evk: Add goodix touchscreen support
      commit: a11e6951396613cddac3d7c9119de1a9ed3feaac

Cheers,
Angelo



