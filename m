Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA22606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 14:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jT6gAxi0;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z3Yu72eG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nF6oG7qdYpsHcUJcCpTVAL6/z6SjIIvM80+qHFQC0Tc=; b=jT6gAxi0Y2nLVi
	9c7KQytaqFBcMcqCGnDoiMnt+8HDh9mcCdkwEMY7Z96xoTKEUB/MsechQ6n95b6uhI13Y2PSg7Ph/
	htT6tHwp++jAbl7NCmmX3IFlmeld/7zmcA5ESNsgnxPMYtsvuX3tzZu5mXxHhDDVwU5ceOGI9lY30
	0TrEK1qKrwdLevSlZ+4aNY1ZXS/03KZS0T7LBRiZ5IQ3mBcVaZEEUpznKBJzpaKv+3hxjmoG4+ZiO
	PxhldxwQxeWk+pSA5Lu1Eg/r2PGpjDGCA8MJmz5OQlz0dLkYTwzUzOPDG2qhVawgSJeeXqVwt3fbz
	5YWsszl3MVfKjhQHER5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnJO-0000000BqVx-0DV0;
	Fri, 30 Oct 2026 14:10:30 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnJK-0000000BqUw-2FsO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 14:10:28 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48c45111bebso335853f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 07:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793369422; x=1793974222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nF6oG7qdYpsHcUJcCpTVAL6/z6SjIIvM80+qHFQC0Tc=;
        b=z3Yu72eGIENjaDbPog/0IiFbZKp8RxfWrWwpd5aeUbPoMDnuO1hFsxnRwtfsN0xmEO
         wrjzmgBLeJ6JISKBoyQCUGWrGsrxiavMykvg7MJZnhLSONP1Ki9jtBG4QHt7c8BQTDGr
         wHGtW6oqNrTO9hm9EO5++emueAsWgPVCN7XuhoCjPhW9nYFDb57k8TDFBDKMjsdq3ug8
         LY/i95BekL6K0QeEFBOXqT0z9R6EZ+xg36D6TRn5UaBi30fAOPrqRy1+1LjZV0b86F7H
         3Q2stXqAGL4WpB/ti2NR9bptAYC4qiYQNDAcEwujm2/nJ6LbZFDozij1KRcYfkk+YNto
         X9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369422; x=1793974222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nF6oG7qdYpsHcUJcCpTVAL6/z6SjIIvM80+qHFQC0Tc=;
        b=NAemCbSLLkD0wJM2aYMszPMNc8UN2mfG97QYUmKlhAYDWBWeaGZNNHQksd+NSMpcOx
         6xiIPkt2nrEHgh9qQaPOpOYu4DB+J4gS9T8qP7ApLjpvZvtO3vzfEqYv6p3PGMfXu6Fy
         lPTnqv+TQIWQ4i51gw0mm0YZd6xJly50sapfVUH2lCoMvdL50rEA1KHwPcTFkpr6lzqA
         4G7UwwscxGjmnb1q8OK+hsJ3L8osmzoh/u2NFKWFVXjhGKHqnKpXouVy9fY1lUyAN56e
         fZRkXENheB3lGY6Ko9Ox2+DGLSozV2Z8olLHpjjbQH+7SAbKUl/pfuYihwPrNTJUAtkp
         v7Bg==
X-Forwarded-Encrypted: i=1; AKwUvBzuX2URS7LXU6CfjqZXGtVjFlsNEP+VssuPf1DEwUwKvhX8+96kP2txaXfcbwtCKrRWmgZZbk1XwUuROmNY++ph@lists.infradead.org
X-Gm-Message-State: AFq9FYLOrCNWXUpvSVwjwsETfGSsjNQhsM2aXeSNCQoUmLw4WWuyo7dY
	h4xsX1L8er3NcV4a0zQoq+cetxqXsgnMly+j1hCzbIQqFJvJBKlg7WVS
X-Gm-Gg: AYBFou3G5EpVxG8eyssmhEPJ8PQkUnISbrVJ0ntVGuG1utGF2+R3yQTOuvD9zuLd13p
	8tpJHxv1s4G/QEA04G3tS7wuswcSBfOFS8McdYRCfYZoyCqF9RBXLnM1WjtO/cHddbJf893e0eb
	xpaz0eJ2TIelnWcZlEZZtwGLZtkj8ESWlTLSusNRZrbPPPrNY034lEyUsefSPVaAq3L8a233iRx
	qdixERRrJnCw0MwnF9Tyn48YUvtFYgxmVnJInzHM3AhrxkMF82icTHagBbvPydwAadF6Hl2vuoA
	a8oobIdyHerqvWbS+RsdnifW9u2U/aZXnvl5ylg6W53FEgZW2gWGzV15dIrRxf9bQ6ERlLMmg4I
	J7K3bOlbg1GwAynqa4l8J1TcctDsMCKrJ1vnUphUffVXzVGDxfvX2JLznteET+ZJ6XqRBeUaJV4
	AhD43dV7h5zcCCGKX/AEaEFfZhutjQQlH4R4GDfQ2us0CSlyZ9qks1eQyB7nBsFoPWNX/dBbns9
	N8wPJ1AZwuVhf65EXhrlz3PL+hQ4u5KHLpcfaDnvy/VkH9W0+dG8Z92XW8GaYTpiCbU7PjzwRUp
	e2vGfdJYal+MNNrMKs+UMxpV3rSItglHmwmp8sp1gOg+lSLUc7MSTlSVFEh1+z8h4MdlUO0Fdo7
	YLnF9JYkG
X-Received: by 2002:a5d:6f0e:0:b0:48d:ea67:79d4 with SMTP id ffacd0b85a97d-48e6e518c14mr5740707f8f.53.1793369421351;
        Fri, 30 Oct 2026 07:10:21 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:39c2:e340:24ce:a263:4d8:38f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba53d7sm5181973f8f.53.2026.10.30.07.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:10:19 -0700 (PDT)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Romain TISSERAND <romain.tisserand@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Heiko Stuebner <heiko@sntech.de>,
	Liu Ying <victor.liu@nxp.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: use the lane rate for lbcc when lanes run faster
Date: Fri, 30 Oct 2026 15:10:18 +0100
Message-ID: <20261030141018.3851266-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <9e3dc854-b2f5-459c-8267-55e88e87f5b5@rock-chips.com>
References: <20261025142639.3454322-1-romain.tisserand@gmail.com> <9e3dc854-b2f5-459c-8267-55e88e87f5b5@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_071026_588978_106D6DC5 
X-CRM114-Status: GOOD (  10.87  )
X-Spam-Score: -1.1 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Chaoyi,

On 10/26/2026 3:17 AM, Chaoyi Chen wrote:
> Adding different glue code for each implementation seems like a good
> idea.
>
> Maybe you should try to add a new callback in dw_mipi_dsi_plat_data ?

Makes sense. For v2 I've dropped the threshold and added an optional
get_hcomponent_lbcc() callback to dw_mipi_dsi_plat_data. The Rockchip
glue implements it from its lane rate, and the other glues keep the
current code since they don't set it.

I've retested on the GPD XD and will send it on November 1st.

Thanks,
Romain

