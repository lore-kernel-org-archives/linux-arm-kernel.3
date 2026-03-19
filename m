Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A391090240
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 15:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFgqb5rsN304hn1yidJ0nOfikkdeXDRLu7+cGvuE37A=; b=AYl3HXD0HIph4L6aMx73iW+S3z
	/yQCfN/7H1eyxfx+zKx4KZH1HfGjxCrCJZySjCthG+1DNNLd8IVZiJhtxg3JW8udKA+9wbTEPlo3f
	PLzH7UIHrMA1c1nBpX8UCAQJVfAx7OCCJImxooJHozhx8K98kCwFuuK+wlB/UJbHwyJdt9UnSO414
	G0yo/NHQeKnK8r6xweNCHUBUYCvWnLtYnAMG9JB3VrZ9D9SpG/CSOszp7yLRIOlXAn8d4moCPz0D7
	NwnDtYkvF3CRgMFw98iLXkeIgQRj1ZCecboTRUrUkSHiZB6QwHVPLU5L1KrrmtPIIWNTiDJwaqX7P
	nAWduu6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3F6D-0000000Asvu-1j9P;
	Thu, 19 Mar 2026 15:15:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3F6C-0000000AsvJ-2vgV
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Mar 2026 15:15:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:To:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kFgqb5rsN304hn1yidJ0nOfikkdeXDRLu7+cGvuE37A=; b=DLsimbTjwm3wQVmtsnkNfD7y4p
	5m2Sfb+ZwMg15n19SXBQBUNS+QJjthANyheZN1xm5d4tzr9sV3BxJfl9fzg0kipiHymgUN5CGU9JR
	s0ZWm8foE5qe+luDgCBeMbp7quMJ33Ypob4nxD6yfRE8dEKZXzQBOLt2dSMTBde/joCvLKKavVgSx
	h0Kcu2S/HCEf/Tnj3QHQq0cB23Gjrn+RFmL4U6ZO9Ff3amad5F90fmqtCCq3VmXa5xF7BUzEPxlcd
	lgCYiEPzyRZjDASLSz9KroQxSB3XmJSFvc+1GQvK4clyLET7lbVG8v7dtFa/MnY07wNiXblKpxSis
	tfMf1C4w==;
Received: from mail-4320.protonmail.ch ([185.70.43.20])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3F69-0000000DnDT-2pXf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 15:15:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail; t=1773933331; x=1774192531;
	bh=kFgqb5rsN304hn1yidJ0nOfikkdeXDRLu7+cGvuE37A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nQmikT5x3kyd5Oxybtr4gMfEdbAbzl1gxcS7x28m0QtxshPqbo+1RVwYUe5OiDN1d
	 8cXgoVIoTZ2RxMLhOyahWn/+DsuRkQnHgyo1W0a5Lau2p2Cg3dFwSyFBRXAm0SmfZc
	 mCyJRkUnrDcoeWvmp52ATX/m8bY+DOrVYsv2g4Nkb3l0wRpnWrgeg2HXz3ES/XjCr4
	 Abh3J4rUsuDENL23pq5abzrexuoLhSJqxVKpoP/MxzU39w4F6Ir5Rc+bJOpZrclV4b
	 ceZzM3SoFs+Bhq02z2oV0mfICymjmAWLMWfBb66OjEQYjZlwySMFYajRTzrWWkmGQt
	 Ut9qevb4B5MTw==
Date: Thu, 19 Mar 2026 15:15:28 +0000
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
From: Simon Ser <contact@emersion.fr>
Cc: Vishal Sagar <vishal.sagar@amd.com>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Pekka Paalanen <ppaalanen@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v8 02/11] drm/fourcc: Add DRM_FORMAT_XV15/XV20
Message-ID: <K_oXHqtPM_1bdhpMkkQMreIZ9OFfJVpHO3GV_wzmK_PvjQEw4Qz3IMBhGDNVQllkLg_GQeMGyOi6wpIFaRjrNkHubTwWQm-wqvKYTi6zEA0=@emersion.fr>
In-Reply-To: <20260128-xilinx-formats-v8-2-9ea8adb70269@ideasonboard.com>
References: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com> <20260128-xilinx-formats-v8-2-9ea8adb70269@ideasonboard.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 7e4f2e126e572c1a68030735b1f4e911c7446907
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_151545_881831_CD1D1D95 
X-CRM114-Status: UNSURE (   3.70  )
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

What is the difference between DRM_FORMAT_XV15 and DRM_FORMAT_P030?

