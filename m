Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4C3E8FDB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 12:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ildhAJVbNhT3jHUiw7GI7aaICTJD4Ypsoq9przBx30M=; b=JwtXt2fQHoJcNOjkJSeufJUGQC
	gEn9ETwXKAnawVW+CKBYejEH4LU+r3A4wKgaocckyrlQQqgKOGB4e0XJr//tJzXHJKzmWN2NGQaGE
	q/TiRUTsp7S58jVL207N68zm5hfRoJFfCFmhHiNM6tb8BaI20AHpeGsdTkS9N/l88qkPKMLL5sFki
	AE0BhTUs1BWjmzVcJk3XRq+nxXvPZ70Wqevz2kpeNY9yaBY4AT8pP0Q9IKwnZtGk0uGnAmVY2QNL/
	r6C9nm70FD7Q+df/4XzaZVX8uMNJOGCg5wPZ5GyjkaM9f0LrabLCe7djNqTzvGTqhxktGsD8unOol
	nF32JSiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaCd8-00000003hVI-3qtF;
	Mon, 29 Dec 2025 12:45:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaCd7-00000003hV8-1HB3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 12:45:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A2636000A;
	Mon, 29 Dec 2025 12:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E53C4CEF7;
	Mon, 29 Dec 2025 12:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767012344;
	bh=ppvgd/s8wvK+A0YDWqm9HszRKuwc9xFTsTgQi0kIFOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DEg/gIqtUk64VpEQIXk1OBXy4EsiPX73QhRG5+4YyVjKDan+7MWbXyFcRnSi4ApLK
	 7AOExY0fJsPBXh/Myrhe23jnt6aZewikrjs/Tts1lDbN1JWH0YOz+Owhi/8MA3pYps
	 LU2nwn21u7VT14jwHnIqi6Vr0SrgUOqCy4046PkVqNlJ/CwrsP4zhEkbrAtOyYfYxX
	 sEkFGFWtKwKqAPLBYw+nU/srfB1piOST6yb5rs6iaAaA016tL5nlt9Hpwc0zLcvEME
	 UAgqZSIXz74FaCA+rv3aMeT55TCGtzLKvodeg0ew0EYHaMvZPbGx9kcb6v+3tEC+EC
	 bUbiReHC5vxVQ==
Date: Mon, 29 Dec 2025 20:45:39 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] arm64: dts: imx8qxp-mek: Add sensors under i2c1
 bus
Message-ID: <aVJ3895nxmH_M8au@dragon>
References: <20251120215350.352117-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120215350.352117-1-Frank.Li@nxp.com>
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

On Thu, Nov 20, 2025 at 04:53:50PM -0500, Frank Li wrote:
> Add sensors under i2c1 bus.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

