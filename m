Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9859E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 07:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZEI1xXEiy3eHX7ZLavdCZHjpLbi/8PV+p3rxj/veojY=; b=3O/tm2W7eIQTE9wqgvG7KVNtsO
	sH2Y4X3yapR+HjtqamT0YgoTOLU7h2nRKT7//fGYMqbpSwKSiiUKvl5TFWU9fmsJ5Dr4Xocftwq6n
	Q+Br9zwdHTp8ig1QthWon2LZSdXsFKFpPvAx1Um7ccIzDH4dMhvl3NMPA6hTnWLZkoDRWYQ/8U0B8
	eBRfViGMOO50anNFGGvDrAS0lmqGleIrJowmRT4QhfUOCNln4MYH9klsJG2WqFae/8dSbHJgD34Zn
	dWu0NoixxjQ/iddbdenVt/vky73/j7t/0H8IPF5/IDE/UyfVuDkLkSVcXuMCcDhv50i4TIN6AxjmR
	/O/1SIyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW9io-0000000EQUg-0nu9;
	Fri, 10 Jan 2025 07:46:22 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW9hZ-0000000EQ8f-48Mg;
	Fri, 10 Jan 2025 07:45:07 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43675b1155bso20293575e9.2;
        Thu, 09 Jan 2025 23:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736495104; x=1737099904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZEI1xXEiy3eHX7ZLavdCZHjpLbi/8PV+p3rxj/veojY=;
        b=k/7PuMX0tlW6D4KJen8MWbB5HXT3jq4VLESaNhaePK4eEVVor4p3AdE7HpvBc3a6SU
         zz/+YpK3o/ZCCcHZCMT0YOVkiTnRoEPR56gww/5o5OIDOdUCji6TBAkQ2KRioJL3mJhN
         M/proPrEn9z7dW9nN1k5RvNnZldBlqrpErI27jpmWnhm5aiohun96iPXwtKFL6HxnGTu
         xSSLp6rrBS/m/06kOzD4K3h7mqvsk+AfkPm2i7LERilkg+Q8ftGs36Y8sLpvGlQtMPiF
         c3sm1vfIfB/M9pUAA0uvZ4XjNFrAnhxu1lMs9fdwzBt3A/lmW01q0odGl62IK94kddX5
         96Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736495104; x=1737099904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZEI1xXEiy3eHX7ZLavdCZHjpLbi/8PV+p3rxj/veojY=;
        b=jLx+x3H1ugXdosO/eUI2slDkDnEnjNAHf3VZbjEYeGF6WZAkAP7sBwHdR17z4p110V
         PsDbLLFZJffOgsHhgR7XFAcZkuYM0HQQh5FH4ZqLlgQRPflk5niTL+lqyqCAmhZhd6mi
         y9VHaZ3F5PvACfAdtTfdkEwe+O08xdrKauGeeEyJCsSFUgOvM8w1DWwO/FZwTHSKhYDV
         2JzPI8MJii3P4hX4HE3It19+2DQ4kEr9/RI6zRjmQ8j7vETVAJ+D3j/AWZf23PlRfDWO
         7oG6zJuuEhgPd3nMBAeEX8/RaoAw+Qs+dm86MJQrZTnx2lDVELSNVY8ahLWgAO5TY2Fe
         UUSw==
X-Forwarded-Encrypted: i=1; AJvYcCUZiSauhBef9lk33c7EcULUlKXw0fGK82RV6ErfffK6XX3AcV3cOeHfRNXbzGq+IgM/kXf2GgoRU+lwiyqM@lists.infradead.org, AJvYcCWmCgwbN7oRVN4oZRmxGbEPKb288atPLYvq42LVsJzrGStFXI04Fv6yo8iLzrqxfwWLgAwxyA7F1Wve+VTNM9227g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgUHzXlRarUnDlEURPioWVAWgW8SGB1CuX1qVortRhMYXW+pZ+
	jOJ8R1nRpYF98pSZbKfIz0E9Mn5yBPpTTRrJGVMEb/LPOR9vxBSg
X-Gm-Gg: ASbGncsb77pQtsaDrp0VqhQPMrI6wLBp/ji4k8/TMj5s8/Ua1NJNH+fMsMYK8rii9G4
	+Fyp52d+V7xa1EMsLvn11a1fst3wq6PXVT0n+0lbiqpQsBOqM3jLzR46DAMeFQJ3jLQmfCkzNEs
	Bqf+hDRxq6LpDuJ75qvVamVUdFN43XeRktHM+bqIwU3Z9gCVdOvuBkaWd/mBUMxILX8jTZuOHUt
	cfBfz+XhwKvo98krTMBBLtsetkdgUb8CY7ki7AA1L7wZOq9YVkgINoSERE8uw==
X-Google-Smtp-Source: AGHT+IGGDp1CS4LIVQFO1s7kZIcIY03EtBwCuCHImR+v3eVBXdZXO+UFRjBaqrAUDU0Yd3vhoReXcQ==
X-Received: by 2002:a05:6000:4612:b0:385:dedb:a148 with SMTP id ffacd0b85a97d-38a8732c728mr8125988f8f.46.1736495103960;
        Thu, 09 Jan 2025 23:45:03 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e8a326sm78547995e9.35.2025.01.09.23.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 23:45:03 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/meson: vclk: revert and re-fix vclk calculations
Date: Fri, 10 Jan 2025 07:44:56 +0000
Message-Id: <20250110074458.3624094-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_234506_020223_A97028AF 
X-CRM114-Status: GOOD (  11.13  )
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

Patch 1 reverts a previous fix for loss of HDMI sync when playing YUV420
@ 59.94 media. The patch does resolve a calculation issue. It also makes
all fractional rates invalid which is a bigger problem.

Patch 2 provides a proper fix after I figured out the actual root cause
of the original problem. This time the maths checks out.

Apologies to the stable team as the original patch has been applied to
a wide range of older and LTS kernels (as far as 5.10). Please let me
know if combining the two patches into a single 'fix the previous fix'
patch would be preferred?

Christian

Christian Hewitt (2):
  Revert "drm/meson: vclk: fix calculation of 59.94 fractional rates"
  drm/meson: vclk: fix precision in vclk calculations

 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 42 +++++++++++-----------
 drivers/gpu/drm/meson/meson_vclk.c         |  7 ++--
 2 files changed, 25 insertions(+), 24 deletions(-)

-- 
2.34.1


