Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A33DCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 14:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrpws9n9MkXC9vi1VL6ygDXUL8fjD2xYcDoZxFTVUaY=; b=MXyjylXcu9akAjatDi/Nwg2YMY
	XyPIB0OnFYovCPrOsSqVyDaOrc9dYWgPVJavi6pb2Kyv3PsHEr6BL6cwFpoHvHzXs6oCbYx+YHcuq
	FP8Ihre7up/qCYpK/AUvTjr8S4bdQ3ymONAmXTY0V/huvpITzXfMOvg78tWcHbluYuWErV1LxcCw/
	A4lOo/J+6zpt5mvQkvTBco5cV+ArghCs86d8m62paTVyxv6igQOWVhk+aj6jK7JHv0C31qj1qz/Bb
	bV2NwprfXexkhi74TV8rHckMMO8bG2M6Y4F4ozSGYcZKYkQ6Cl3Wma2JWUT88CyrQ9HWyWDHabGzn
	g37hOroQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAWd-00000004mDV-0sIW;
	Mon, 15 Sep 2025 14:49:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAWc-00000004mD5-3XR6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 14:49:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0953E60250;
	Mon, 15 Sep 2025 14:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780EBC4CEF1;
	Mon, 15 Sep 2025 14:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757947789;
	bh=nrpws9n9MkXC9vi1VL6ygDXUL8fjD2xYcDoZxFTVUaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A6sAMMncrMLJO//JNi/b3zFwf5hBbeUa+KqInij8EsEasDj2PnaRUTSI0oy4GOJE7
	 8SLXNTTH+I2Q6Ms7vV8KBsQcLr91IE1Yfumc72WTJpUpQcXayRV6laRMsb3luf/OZ6
	 4gmytXYzMv+38RZ23uV+VH6/nVxmxu0P8mRISazzHOT72ay9tkcccTSCALVsfFaB6v
	 NhuJpU7ijOH1Gxx5tS6jRGDe6sS+cQZP+BpQKW3SMbQ5ak/4sezhD/1GXW42C1cpXw
	 NcPDDoeApdOzdfMTns6oIKEMWVoRx4Y6+Q5mwpKry97SNBpok9GXqluE9s8B0WGXc5
	 lY9NNYYlusiEA==
Date: Mon, 15 Sep 2025 15:49:42 +0100
From: Daniel Thompson <danielt@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, neil.armstrong@linaro.org,
	jessica.zhang@oss.qualcomm.com, deller@gmx.de,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, fnkl.kernel@gmail.com,
	j@jannau.net, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
	sven@kernel.org, alyssa@rosenzweig.io, neal@gompa.dev,
	support.opensource@diasemi.com, duje.mihanovic@skole.hr,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 08/15] backlight: as3711_bl: Include <linux/of.h>
Message-ID: <aMgnhlFj_44gARiH@aspen.lan>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-9-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715122643.137027-9-tzimmermann@suse.de>
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

On Tue, Jul 15, 2025 at 02:24:45PM +0200, Thomas Zimmermann wrote:
> Include <linux/of.h> to declare various OF helpers. Avoids dependency
> on backlight header to include it.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

