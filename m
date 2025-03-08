Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AD3C28B25
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 11:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xnnNqxownKeU3GNDrkJTrs8uiEmC7dJ+ZmSVhNEpneo=; b=PG3U8RwWc8m8IwpgQnViHudlkm
	6CpadV5/FukzrPmv9i3oX/P90crFIMINgGKn0iT4NOTZGqgeOBM9+nMySE/X3DEh57gU98a6z2QU6
	MPB7Le6/5bMNRWnbEgE9XA6oDWdQ0YaKpw+QY/HRUdNkHylq2htCHP5ujt0BRhLG+wwmEbb2Vybtd
	D0Iid7PoRjRJVKxNUKxUuerkE3MvgrOVLMW3RRtZ+wfdufAS2ckdwF2+vW0jf6Kz73S4vfBIdERpe
	jPcYaPPBuu4jQQ5X8czKjFqzBheyNdG0vcBjUaJFn5c4BUnq+bhdQevzmy41S1TqlUlT3d44zzkk1
	kDclKMSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqsCd-0000000GXjS-2Kkf;
	Sat, 08 Mar 2025 11:18:47 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqsB1-0000000GXh9-1gdj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 11:17:08 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-390cf7458f5so2617944f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 03:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741432626; x=1742037426; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xnnNqxownKeU3GNDrkJTrs8uiEmC7dJ+ZmSVhNEpneo=;
        b=MQKcmJg3JQUizDg/wufBUIUrvC3IPR6Y95a8RetVyyginKgFEABMBFT5t2QPqQkCKN
         13VGLOcX5o47t7DXGkrQa5QGBD9HXbGe+8b2SmFPcdIdkVPikgilHsSdj20zZI694+Jc
         DvulmJmqgW+aPHjxhEivwzRtsccphODxqWJ4j+W0yPsVZmEpMj/0WKHndRxOohT+gm1P
         WrdRb1MKTXF0uNwWn17havZOv30ADzUpx6NvdSeQecMPDay39l4hPOTyYq9BBUrZZ99F
         CEOuZIiO03XN+p18xj3hiR0cLYq+zlT6micZeVKtnTodKVif6LAXWcEQaZRinrCyD/fY
         xT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741432626; x=1742037426;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xnnNqxownKeU3GNDrkJTrs8uiEmC7dJ+ZmSVhNEpneo=;
        b=tyKSmgvjgUwaTuoS8zx8dmBPqIt8ErgP+MT2zLG62/d2zrZF5WL9DhvmuL7Acn2vpe
         Hp7qlrY3KXz6ZMxKv8JMS5k/rpARtlkIOpdeVTTdC+7/SrfTROIMH/dbxFclIhvL4uGs
         hl9VGwB3g2sqP/XZwb2sYYILOPwiyaqrruA9qjJpi3YUrPa+6rBTGYiz/l085G/IeNbX
         LSXCwVBgMp6m+8BQmpyOL0Z/WYLIib/873oYXaIkurkK7bm/ibMDpkqRjRSrBVjKmhxY
         DhujdbhoTA8ydeCeSMLAfxKYRhzpT8mCazD73lwVGOK7jSHNwbSit3OFuc8U23l8YGHs
         tDIA==
X-Forwarded-Encrypted: i=1; AJvYcCWNUhtAkZVB4RNzeGJR2oFwt7wAScXCdFp1o2WKCe9b42fVDiID4eCKBq8knb/nrh3443rA0nYZpO/n4IsFdp3E@lists.infradead.org
X-Gm-Message-State: AOJu0YxnDH7ohj/l4SB66Nxy0tFDvRWqxFUkH8vR7ZAaiSB0mHqsltXW
	vUPfyKCDFWv+EpjLzYuX92HQssNy2eDN0EyTT40PT7k9UAWcWHSkx5c4IHXzlspfgPAT6AVyBeO
	7
X-Gm-Gg: ASbGncsLJleTXTysZ09ReqoSA0RObGhS1mPgQKOKAE0qF3TyZP/xXVldg9EDX4sG2wk
	fioNc9djhqxx79kYDivvXzqFbhLBiJYQ1+g0J5t/lzhZXoOOAqBtK9jpjyUrlVbnILTruQWEz/q
	iypZzgPs8e+uuO1yxK7iDgxBd2hKloU+MAslbjeMPRnl+SEBiF0eeSc6D891TbAMae9w5iYl4Zf
	xDqSrKYqTY9mnL7ODk/C6OSDnwjYkxs8AZXN4oa3mIzSwAyw+Pw8ryJ677tVM1ZffUvxD9XBw3X
	1rM+2EUghPCrXCfy98fTcm80aLUj5MVf6D9aywznHYSIDordLg==
X-Google-Smtp-Source: AGHT+IHgPy2ipS9U13tlaxW/er4uS9dL0vgcgs/ixqt3JyEdpvktSnhmqJQ1s8kCsjFpv/J/9JwBaQ==
X-Received: by 2002:a05:6000:1fa9:b0:391:212:459a with SMTP id ffacd0b85a97d-39132d3b46fmr6741762f8f.22.1741432625810;
        Sat, 08 Mar 2025 03:17:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c015d1csm8339913f8f.44.2025.03.08.03.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 03:17:05 -0800 (PST)
Date: Sat, 8 Mar 2025 14:17:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [bug report] net: stmmac: configure SerDes according to the
 interface mode
Message-ID: <677ffce5-0d76-4b97-abd3-1ac7608417f3@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_031707_442551_92CC4CD7 
X-CRM114-Status: UNSURE (   8.86  )
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

Hello Choong Yong Liang,

Commit a42f6b3f1cc1 ("net: stmmac: configure SerDes according to the
interface mode") from Feb 27, 2025 (linux-next), leads to the
following Smatch static checker warning:

	drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c:497 intel_tsn_lane_is_available()
	warn: missing error code? 'ret'

drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
    472 static int intel_tsn_lane_is_available(struct net_device *ndev,
    473                                        struct intel_priv_data *intel_priv)
    474 {
    475         struct stmmac_priv *priv = netdev_priv(ndev);
    476         struct pmc_ipc_cmd tmp = {};
    477         struct pmc_ipc_rbuf rbuf = {};
    478         int ret = 0, i, j;

Better to avoid initializing ret so that bug show up as uninitialized
variables.

    479         const int max_fia_regs = 5;
    480 
    481         tmp.cmd = IPC_SOC_REGISTER_ACCESS;
    482         tmp.sub_cmd = IPC_SOC_SUB_CMD_READ;
    483 
    484         for (i = 0; i < max_fia_regs; i++) {
    485                 tmp.wbuf[0] = R_PCH_FIA_15_PCR_LOS1_REG_BASE + i;
    486 
    487                 ret = intel_pmc_ipc(&tmp, &rbuf);
    488                 if (ret < 0) {
    489                         netdev_info(priv->dev, "Failed to read from PMC.\n");
    490                         return ret;
    491                 }
    492 
    493                 for (j = 0; j <= intel_priv->max_tsn_lane_regs; j++)
    494                         if ((rbuf.buf[0] >>
    495                                 (4 * (intel_priv->tsn_lane_regs[j] % 8)) &
    496                                         B_PCH_FIA_PCR_L0O) == 0xB)
--> 497                                 return ret;

This should probably be return -EINVAL, right?

    498         }
    499 
    500         return ret;

It's more clear to just return 0 for the success path.  Otherwise you
have to read the code a bit.

    501 }

regards,
dan carpenter

