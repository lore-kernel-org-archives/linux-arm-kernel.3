Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B3D10A62D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 13:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=; b=hv+lAfIzzd8o+f6GDjsGZmZ3bm
	nMGTujECpTjPxN43K2zSSoEfUa+78pPJQd90Ove8ah3/wT4JWM/dJF0Nx3aUP0SIvHs6HqgXVsgP9
	0Z3GYMzaFG5SDV9F2xHDNgB8y2dcm/iakZnEQGVoIQspMHAVTkm167HOElIsTzn6J206cibUTfayh
	siXqFmYU3M3FlPbeFv7d8TaxWbUJ1CxPnZKY1VtGVzrPskZjCmcWF0I9jE7Jalh7aASjSWAIhd579
	EKoREFKqiswkCeghHymOJfADCA0XR+Iipq4fb63rbD1H/DM+LYLSFmTpc9RFdV5alJ3D+pbyPHZPv
	ofUgAQ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lC3-00000005aTZ-1CWw;
	Thu, 26 Mar 2026 13:56:15 +0000
Received: from mail-10624.protonmail.ch ([79.135.106.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lC1-00000005aT2-1kuJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 13:56:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail; t=1774533369; x=1774792569;
	bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=hSVxEp7VtFXA4JMyNXv5YGmSF9PPCjwJnlexHMMdHY7FWkPqByp3aCtpi1hknjG3J
	 jJ6azTuLJdkaPbV1wzdCSoA3FIclH/7Hgc0ekC54THoDvcCsAMH0nqgqWE49Wc/GYn
	 UnzukT94MtmdBsRlE8Ko4V+0d0wHwoV2Mwf/Yhm9X4lxBZmAym29aiaco4eDKMNxx0
	 jEMwjJ4Q1D2E7i8BBw8Ft4xjgl8Ac9zFenj2Y07Rh3grUD1NipKgO7x+kbASMGpNw3
	 FgLD1mbgYlPTZo5INwSmjYPoYtjSql3V1+CoWDk97bXW0CIFRpNq5V/673geuQh9zu
	 7tsHj++etDjZQ==
Date: Thu, 26 Mar 2026 13:56:04 +0000
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
From: Simon Ser <contact@emersion.fr>
Cc: Vishal Sagar <vishal.sagar@amd.com>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Pekka Paalanen <ppaalanen@gmail.com>, Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v9 04/11] drm/fourcc: Add DRM_FORMAT_XYYY2101010
Message-ID: <OrtEcBd45ot2c7iDqotL9LrxFdaFGuVuC1OsRz2tMnpDMtloElKO99N1c5fqFbCugQvsovsfT4B58zOCNFTy1UYxUkIxN_vqCSwzCdXFthA=@emersion.fr>
In-Reply-To: <20260325-xilinx-formats-v9-4-d03b7e3752e4@ideasonboard.com>
References: <20260325-xilinx-formats-v9-0-d03b7e3752e4@ideasonboard.com> <20260325-xilinx-formats-v9-4-d03b7e3752e4@ideasonboard.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: b37a96848f52efdadcdec4b3467ef8b40ee2e97b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_065613_609911_2EA83F7D 
X-CRM114-Status: UNSURE (   2.52  )
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

Reviewed-by: Simon Ser <contact@emersion.fr>

