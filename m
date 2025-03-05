Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08EBC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 11:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIyBMmpEX16BmxV1lcAMHYOSL+4ClOY5xXpYYnXA1xg=; b=wW7kWrY0ZC9Jqf5OOdG3Ezx2NZ
	LCVI0Ep/IoAKj62Jj0JvisawWKOZL+R+qrRnhmrKlmBDloq25EdRmVt3hFKWT0cTWyywtFLNWzoFv
	C/9/aVOZHJhbv0sgw8kHdwJyeU7M9z6RCGWvfqtjwxAHdzDvnO/NBt37yLIoyzZ29Oytrk81SUpjP
	hN4j/9DX2re6mI3ZOkfbGaVMVOGIfnPxls8ShNI0MAvRETAK+IL0quPf0bh0J+rSKjHvqZg3IPEpD
	FCxenbRwhaZ9sC3Zp+begLBX+Mps4GVPvYfhYT89R4+KphekXg/nQFI8zASGN/kkGe437SCD9OC0c
	+SvQHe8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmnn-00000007q3j-39ZM;
	Wed, 05 Mar 2025 11:20:39 +0000
Received: from mail-ed1-f43.google.com ([209.85.208.43])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm15-00000007gUc-0OlR;
	Wed, 05 Mar 2025 10:30:20 +0000
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e033c2f106so7777220a12.3;
        Wed, 05 Mar 2025 02:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741170617; x=1741775417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZIyBMmpEX16BmxV1lcAMHYOSL+4ClOY5xXpYYnXA1xg=;
        b=cU7Hj+4RywUJE2Smc7RDD5o3xo37j0VttwSC0QOQ0EJe/ybaw79aLaVWxnTKYWhKMb
         PDeq2GAKBZKEmh65QegvTm0hk6TnG0EaMpKDUSWqrXuuNMo2oS4Nb1RaqXev0l4yTr6B
         2dogUH3GjJQMJ6VVkEWba6yDAusb+pFja3TXXZcOM+2yNq10e6OIrWyhkSEPBV2jf7j1
         Z7C2gj24eDA8ZhadE9jiSOiUCZhXcKgkJYICaotLKdwFcnwk5OESJdRxa6Gh8+p/PuyO
         Tyy4gOyesUCKInpbjY0AfykPNm5fdhiS32KrtfeG0fflRRX+kgVuJCGfgevBwuPKvXPv
         shRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741170617; x=1741775417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZIyBMmpEX16BmxV1lcAMHYOSL+4ClOY5xXpYYnXA1xg=;
        b=Og5D4/GaAaQiEWvJF/E+qhHNhjxVq6ijS3BOlQ/gNS7rHb25cb1gVcN3sFamSUKmWJ
         auvF40vOoYyMt1nybE066D6Shtg40Lor0jdTEaypoxOK//Jr6T4IcUracsBSnQhK42rZ
         ZfJiFOjjo0x0DlGbGy62UP0grPcU3B5QdCKgOeEuJZ8eSZTIGFiY2dkckemk/qFPlQnL
         LmmpZLj1ETggfVTtllm1ThHfGl0I7mr5aNlk8CSzjVNWG3vrXXZ5Azw18f8ztIPggR64
         /HW8sZP2morsakpjd7mVu6iinViKOJhLJuUC1RKbX1JLvl5F4C6bCVkI399sF09sEoyp
         NQtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBeq71q1I9sBYAHr975zNDlUorER0wXuJU0QPr9+0RoTC6nX3DoBxcVmZ4xGjbuNasWdqHRdnsnEDlChtqMZ4H@lists.infradead.org, AJvYcCVP4H8MTOVlDx6H9t1dyb0Ki0uyM4GWoR+RD3B2eWbYJWz62mBJQ4+UHcIQp7MTQdi8UJC1H7+TothnVH5xZu8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvBJtcz924sDT2NAiWpahxvVCzz5lsL4HIcKmJA8tz7+Gt8rwE
	P+SHBaW59nC2R8FloTwZDXEEOBDznjIQOStkUk/OeojowzpHwUmO
X-Gm-Gg: ASbGncu6XjAVXRZ5LAbJCsPTUfamM2wdUMbt4neHuSrGB+Gj3lKo4JTri3FeL9VXTsp
	jYEGcH/zof9QakudnP/H+bvYm4CTnpIWnS4/DnP8k+nqjQDWKvINbCht6s8LcPUj/w8iFUz2yoA
	MqngTvYhO6LaKZdROFhaIfHkCwDq9JpSyw3/tWZE+lYaLV3kUkJMMFS1vx4ZEZvWSYrrzjAYMu0
	NPzVx6XiiRafdwM/ljCLxtvaaKbw4XR+q4gXj9R/S0p/ct+zaG4AQPRJQ5d6VSpQDvVN98W+r/h
	B+UfQZcmY1mH8CkagGpVsKCuwYJ1vh4qcFsgpoui1jbN5J7UhNSjhf+Wa/nuXZu+CpZ5cD2tcjr
	RaVLryocWPwOR8ibsUr5d6SdLS+Hw0Hj15NqNlyzI+r4ZlWef2XMSXzfByyT1RA==
X-Google-Smtp-Source: AGHT+IFpDcHd77fpjokL8xxmcGiwz3SLhwhSLzmlQa1UAPVTwjRjFufxV/YyrDHwyugNXvXH+p5hhQ==
X-Received: by 2002:a05:6402:5109:b0:5e0:8b68:e2c3 with SMTP id 4fb4d7f45d1cf-5e59f4b6e02mr6129743a12.29.1741170616901;
        Wed, 05 Mar 2025 02:30:16 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1f7161a4esm247154266b.161.2025.03.05.02.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 02:30:16 -0800 (PST)
From: Eric Woudstra <ericwouds@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Ahmed Zaki <ahmed.zaki@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"Frank Wunderlich" <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	bridge@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Eric Woudstra <ericwouds@gmail.com>
Subject: [PATCH v9 nf 11/15] netfilter: nft_flow_offload: Add DEV_PATH_MTK_WDMA to nft_dev_path_info()
Date: Wed,  5 Mar 2025 11:29:45 +0100
Message-ID: <20250305102949.16370-12-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250305102949.16370-1-ericwouds@gmail.com>
References: <20250305102949.16370-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_023019_147337_4B14F415 
X-CRM114-Status: GOOD (  12.88  )
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

In case of using mediatek wireless, in nft_dev_fill_forward_path(), the
forward path is filled, ending with mediatek wlan1.

Because DEV_PATH_MTK_WDMA is unknown inside nft_dev_path_info() it returns
with info.indev = NULL. Then nft_dev_forward_path() returns without
setting the direct transmit parameters.

This results in a neighbor transmit, and direct transmit not possible.
But we want to use it for flow between bridged interfaces.

So this patch adds DEV_PATH_MTK_WDMA to nft_dev_path_info() and makes
direct transmission possible.

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/netfilter/nft_flow_offload.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index 323c531c7046..b9e6d9e6df66 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -105,6 +105,7 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 		switch (path->type) {
 		case DEV_PATH_ETHERNET:
 		case DEV_PATH_DSA:
+		case DEV_PATH_MTK_WDMA:
 		case DEV_PATH_VLAN:
 		case DEV_PATH_PPPOE:
 			info->indev = path->dev;
@@ -117,6 +118,10 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 				i = stack->num_paths;
 				break;
 			}
+			if (path->type == DEV_PATH_MTK_WDMA) {
+				i = stack->num_paths;
+				break;
+			}
 
 			/* DEV_PATH_VLAN and DEV_PATH_PPPOE */
 			if (info->num_encaps >= NF_FLOW_TABLE_ENCAP_MAX) {
-- 
2.47.1


