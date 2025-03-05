Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7199EC282E5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 14:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVAkTZii1Gy4XRugZsnKaWDIV+1UdUIxS1E1wVQkwnU=; b=4k1TsI6gA/y8WjMCgXK1t6soLr
	QoUlRsSLJp9GgqzU8he/IfUQRxYLeumKFmSLG66cBkzoItv2bYQEngQIMPhTNpcraXPa70mHK2pJl
	UNQ97tjGWM2nlc2fBcBLuxcJ1QpQIWnLNlapHmZhu4Z7ZmZo8oxwu0KIhrgltQadr+tpC6UUpoKiO
	YZyzsfdhaysTllmFODZKBuUJmGbvvS3+osiY7XDHIg3CNTX3Frz7pofeP+Y1ERteKeU3OEfGUJKR1
	TfmhaiSdgjWL6ru2tq9/OrFY6B9mkNE3iCE5WbUjGMAjyilFCZLIuFC6xRxtLYLQ+zW0+TlPDyQk3
	mjRzjcwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpq38-00000008P50-0iZN;
	Wed, 05 Mar 2025 14:48:42 +0000
Received: from mail-ed1-f45.google.com ([209.85.208.45])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm16-00000007gVS-0Yqy;
	Wed, 05 Mar 2025 10:30:21 +0000
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e549af4927so5419273a12.2;
        Wed, 05 Mar 2025 02:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741170618; x=1741775418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVAkTZii1Gy4XRugZsnKaWDIV+1UdUIxS1E1wVQkwnU=;
        b=i/qQEzz+MD1jpY7OmkJloAIk5eMKDdM2ckmbV+WzE9VQMqqLlJC4jUidWxf2yOnlUp
         3Xj5/bjqZBlMl6squt7fJGQ0Lh7jPv5aB4KLqA9ky5R/UlfP/fUddDlAIcyhfLy6ZFmW
         cirFczk/u1SVl4MCypwDm3/ErMQ4kMUtWtGOu6S6NK3rLmuBHDwEzy8dktNaPUToBlQr
         GDgazX+km5L18+HKul1t3Woqw127uZmJbTn+iKxAfAjH0dYIsu5ESbaEu1c7oQribLwh
         urkKxPoYcGOVCCD4Dq79KTj4Rz3bij7zf69NS4QnJfSvSGEfvGSyy0t+XyfoOCaiB5cq
         OHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741170618; x=1741775418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVAkTZii1Gy4XRugZsnKaWDIV+1UdUIxS1E1wVQkwnU=;
        b=Jo/+2EHtIhjPh91ZWlir9GGHNaTvU8VTHxnHNOUvkAQJkcQ3IljgrRo39Y2uZI/RrM
         ySKQ3o/TCNii0qe2FC0WhGJ1nqrM9GHRpzTkXkLZ32BUU/M2eVXZgCkohaVwnEYNQNWm
         bBzH57VnL6t6V/GmFsVlrBM85VkE8ZhHl6xYpxk9ASsDGTiczakVsDXIBO5w31wpVajp
         sr7UgJI1972EH5B+gvTbqKAKdeM+BlFbeE9QueafC/WIS7TahIry1iMZYvAFC3QUwu0O
         F2KdIiOJ6I6y/5s+zRXi7zucZqdEEG6XHe4QjKbwnrj5D4bpK7zQfUFc1oAROnwQ2wIB
         jMtw==
X-Forwarded-Encrypted: i=1; AJvYcCUPvW00c1XLfusbAJb/Havi5M5jCmO+MwzEZyINho67URuUkMLlCnqfFu+iCQayA02hh1bXuzMKfZHwWJYXXdA=@lists.infradead.org, AJvYcCXJoUMCdNFgGl9Jeet0SEyEWDVjCLigi2DWJEp5/JBofvUCHRa3YwURZHTCpK2UIYJhXsPlRJfvlIp/2A6Ej9yf@lists.infradead.org
X-Gm-Message-State: AOJu0YyXDWbkgPyC93Hq1hf87h/I3zjxiIDqJfy1zK3Lyu+jAzcTee50
	BgocqyGby5vOZL/EceIqp5z6uBWNfH7FzwmO9vMScS45V9YSYnMI
X-Gm-Gg: ASbGncshVBPtDZ4mpkTR4/8WpHGTzqpPD1HB/SNgYN+czI55j3sgAY8ghfoVpmJIRmJ
	T40LEAGUmQMBAyp3gI15txKNlba8hyvlGazuQCLI5ESxMsyW/q3Beuy9imS/q3+SvMw7aHTDEGI
	M38qsqEvZE6TrFJAQxS9fPLQW2bN39FHwQKTGN31bqZlwClSrw+Y9UHejoVftRkgMiyK24ly8XG
	OK2c/HTluUjoWYsrNL3UjUEEZvninD9mFm0A6NZz1yHtvtD31opIc61X8+BMIeliBv2L2gH3V/c
	Nq5OUOtOg6lrcYoXK3rY6Z3yGwRVDdc/Dnfx3X6lO185k3OZXWr8j8tZDl1OvTP7zSESBs65Z0G
	aNsfnyTIH5onpbW1CWtGiQyWTVzdpi6cbMnBY7fMWmBaM1ct09cHPO/MYEZBpYw==
X-Google-Smtp-Source: AGHT+IH76j7PuSAp246zNAO/9bTEHz/TOOLWKA15shLvAnk2YElCcj8yD7y6QikO3QGYtioJiV2+DA==
X-Received: by 2002:a17:907:6e8f:b0:abf:663b:22c2 with SMTP id a640c23a62f3a-ac20db005edmr280954166b.51.1741170618037;
        Wed, 05 Mar 2025 02:30:18 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1f7161a4esm247154266b.161.2025.03.05.02.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 02:30:17 -0800 (PST)
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
Subject: [PATCH v9 nf 12/15] netfilter: nft_flow_offload: No ingress_vlan forward info for dsa user port
Date: Wed,  5 Mar 2025 11:29:46 +0100
Message-ID: <20250305102949.16370-13-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250305102949.16370-1-ericwouds@gmail.com>
References: <20250305102949.16370-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_023020_193391_734CE537 
X-CRM114-Status: GOOD (  11.31  )
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

The bitfield info->ingress_vlans and corresponding vlan encap are used for
a switchdev user port. However, they should not be set for a dsa user port.

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/netfilter/nft_flow_offload.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index b9e6d9e6df66..c95fad495460 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -116,6 +116,11 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 				break;
 			if (path->type == DEV_PATH_DSA) {
 				i = stack->num_paths;
+				if (!info->num_encaps ||
+				    !(info->ingress_vlans & BIT(info->num_encaps - 1)))
+					break;
+				info->num_encaps--;
+				info->ingress_vlans &= ~BIT(info->num_encaps - 1);
 				break;
 			}
 			if (path->type == DEV_PATH_MTK_WDMA) {
-- 
2.47.1


