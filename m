Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269E8606EEBC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hv6AZEVF;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LhzFXUQ5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GKhGMwWEaq+Cm90GvlNAnPOqyBlaMvPivUMvlM2FYLs=; b=hv6AZEVFS1W8ti4Zuv+5d2Xqsl
	zL31VXKHNS/3bh94x5l6nweLk8eQy7SRfIQRzIrk9PhCqP75by0FZu4czldMJZGcQS1GXFPNqay70
	4XUDTZM8NO/JPUhk3rnCpDjJFy1r4y5DSc6F0kHVfpHym4UeDjd61GO1eGjhNwjKxuqshoE7kkuG+
	IqR3zLzLDo3nqMkS1T8eo7D1t/Yj0zvgCQsAWhkRwh4ksIkvya3Q05+ul/PH+8VO1+QyCoc4H/nHf
	SdA3pzPSoRxt06sk7u0Oa8y8lZvin5DTZfqvB5rl0HJR1Syw7CZ1XQy+5j9vKWlRcpzAL7pXbbke7
	YvL/l6NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOw8W-00000008nke-04Bj;
	Thu, 05 Nov 2026 12:00:08 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOw8T-00000008njU-2sqg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:00:07 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48e09aa5264so931841f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 04:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793880003; x=1794484803; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GKhGMwWEaq+Cm90GvlNAnPOqyBlaMvPivUMvlM2FYLs=;
        b=LhzFXUQ5r0T2Kjh8cwTVAHXzfjnpzo0HPtFFWW+6CQZdMxN0n1jKEpAQm2koV+iigk
         M82a0EeKIWjUFk8uO0k73ME3eC0Nzet8nE0ntVqgXgVFKaSavoENDYeKSq9qA3MvkIgL
         iEdrhfrLSbS3P3yx+mSdXNJp5c7vouY7MpRQ4rKVfKjhWRxyhbQWi2Uo5Bbxh7DmQys5
         +iVnTRzm/eE8gW34vD/Srmoil8i4h0Z5J0xzH//QiE7P/5WbmDyp1ZY8pLqKtP8EiC0g
         gUT04zb+vG6dhTI8a+n8QDCGimNpzRRQaiM6sdXsE3eb3jgQhIWTWs92FfhQ1jTNpZZt
         Jrfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880003; x=1794484803;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GKhGMwWEaq+Cm90GvlNAnPOqyBlaMvPivUMvlM2FYLs=;
        b=symuugHjIkUQpYgYDJ91a1VqYQpnUv8qah36zSe8emc1Cyw6/G3QxW3R8EmmIZW8XO
         FRp21+08DQ06nWstARbxovfYM2ymXnlPsy+Ns42SYbSp6yiMbt0wkastCQObLwBRuUs1
         HkcIk3o/fg3C22/11lyT5YqMR1ts9T2nvOpJq11VEkQZ3HBmi1CDR4+8gS+i5uvSAGk0
         0Wt1t1WyiC51kbOE/fVyI7iZPvO47ifzWrGuSu4F7f6C47uc/utxfzNqrdPe4BT1aRt+
         msz/raSE0R4dFrb3KLiUw64GCEbHld3srEIKvK4bvnO99/C3Uow66yjrYLkeb6XXTiVj
         NL6w==
X-Forwarded-Encrypted: i=1; AKwUvByKL0abGf62pRCZvCBgR1hEXqalTm49bQh5+1v2T09q1vT4g5Sf2Shwyfbyf8Sva/UlkaDy1kklFlnUS4QBC7oG@lists.infradead.org
X-Gm-Message-State: APuU4Z/S+wO7+y9Lefux43jDlvCbhNqNM3VIUksyKZg1rnZLLmicxVRN
	KmWT+XfW7kX5AUATm6l7a2SxT0O676YZG+bf+Otd+R1Dryd+pAFIc6vnZmnucTbCDcM=
X-Gm-Gg: AYBFou2C//EJfwFDQ4Ipl58HaW8EtNDicwWIk8VMZSJrlCE/aqygymCTNyUlnIX0hXb
	bUvwFjWmcStkh4/xlRQL27r8s9DRnyGDFGimhFqKxOFDGPW/326ihtr1H2S+/q7g32ta8CYfDdr
	Jb3+L1hQtPLNpiVYb7qUZ/v7FI42DAB5HFon2P003n/WyKeTphZ+eEs5NWsI/dm/ZQRbdXPJLOc
	/GHA1VQ/MogQsUOpJSy/CTvd+uJN0by2iNSUSovadZ4mw5wJr0osgZ0c7oXvKSvLrK4b03TKdRl
	d9mAvgHI+Uj9Zw6OYXwIQFnDE1UFZkpSL5Nnqx6uf1Nk9GNwyPtxPbiah+seMu4fAydMgPfWeTQ
	6kQynJgQBsnZ1rdH8P+yzlBSA8d6AwveiZYShDDnQWF30xNYVhH4v0YPEa79imZlQSQJIShj+MX
	OjlJUT+wBObI7kTwJ1CiTPefEQCS4imIVcEsbjjyu891xrP742yhY65UYuAyceHJgOuU4w4IQXE
	9E/TR1w4CRJyPPVFOxj4OADKEhcGqc2hqb/6PAnxLSgfSTnLWdI3xow3azOD6aquN2ktuT0MK9K
	HVvcYsqKJQS+0JGFfrCq7e9afskT8zwglTSRwclOmhsXFATrk7vidZkQm/64U2oygtlGK5KwGkx
	aECcupVa7Vl6kZAs+n0qxFky+kTyEy//NKmkTIA==
X-Received: by 2002:a05:6000:420d:b0:48e:7508:bc12 with SMTP id ffacd0b85a97d-48e7508bda2mr39449627f8f.10.1793880002818;
        Thu, 05 Nov 2026 04:00:02 -0800 (PST)
Received: from localhost (p200300f65f19a904ae40ca5165ccacb8.dip0.t-ipconnect.de. [2003:f6:5f19:a904:ae40:ca51:65cc:acb8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48fed0844c8sm10144620f8f.26.2026.11.05.04.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:00:01 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] remoteproc: elf_loader: Make rproc_elf_load_segments() more generic
Date: Thu,  5 Nov 2026 12:59:50 +0100
Message-ID: <cover.1793879714.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=962; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=dlFNL/7079gou5h3eVG+eT1NdVjDy6yo/xetSiy1KDM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq7G+3SGG2PzkTYN2mOS+nHHZ3aUUEdmY7PqhmN x13lV6S3UeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauxvtwAKCRCPgPtYfRL+ TlSHB/0f2zV3hLCeaFMGvDmHjdg+j/5IFlFy/1I9gbbilHoloWIuNSZHyN699/+LVlSTqcMhmHi n9XNY0tlZ53Ns0hV6OQmn8m8/cJwLakBd810iEvrbK+zdlETADziNCGWLAyvM934XqLrTqtU3kW LzpfX+f3IaFpGimPEKOrq2r27Xrjr9nh0PtVDsyDiyVioGU1QtBmpOd0fxLvn8Voo5tLFAhDtA1 khBgjXt4t5TUjT3lIFKJjvy3aA0uc+uQsuMK4c9mb204Po+VX7aPr3fqzD+s2HHBnJAhjOg08tW YsL7ATmoSG56BaAFNoziJWlL4i89uLFwls/klK8i7H4i/qbB
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_040005_743736_C4393872 
X-CRM114-Status: GOOD (  10.61  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

changes since v2 (available at
https://lore.kernel.org/linux-remoteproc/cover.1793117996.git.u.kleine-koenig@baylibre.com):

 - trivially rebase to next-20261104
 - update commit log of the first patch to justify the new callback
   working on the device address instead of a virtual address. The
   latter would work with imx_dsp_rproc, but on (not yet mainline) ADI
   SC846 it doesn't because the remote proc's memory isn't directly
   accessbile by Linux.

Uwe Kleine-König (2):
  remoteproc: elf_loader: Create new callback for copying segments to
    remote cpu
  remoteproc: imx_dsp_rproc: Implement .memcpy_tova()

 drivers/remoteproc/imx_dsp_rproc.c         | 120 ++++++---------------
 drivers/remoteproc/remoteproc_elf_loader.c |  64 ++++++-----
 include/linux/remoteproc.h                 |   4 +
 3 files changed, 71 insertions(+), 117 deletions(-)

base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
-- 
2.47.3


