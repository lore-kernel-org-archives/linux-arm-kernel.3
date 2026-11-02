Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB8E606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 11:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rt3o4unr;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NzRFsO30;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=frPT0hho
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=m3mBrDhbcxfP3/IX04+tIZdgrJqn6b7HrBefYlPYicA=; b=Rt3o4unrm/q13OQtgObnm7NmSg
	ed6QkZMrgFl/ygr7rhepzNGO0gh2dKZrVhUsZcs9C932LncXRF+q8LHHt2kRPAFwOG4TLwlC7ao2A
	zAUBuNNMf8nADYJjPccB571jLdPI1d+lnw5+RDjeg8l9KQLwqB/CPpD3m1MDFg0MrFjyPMVxGkd9f
	986bcqzXxgaStCt/hjYTdnEN0Umx+mpOV7J0UOzshL6VdNMv36VqJH5v8pTfxQBNLF0Dh6XaxMJzK
	qBg666O3mDF95p5r+rM/fVI8LU4wbRnmMkILPxCbFAdcwplqPpei3aGWwtasWkJPey9UaeAHdsL8b
	t2cZLttg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqUQ-0000000GNpU-3nO5;
	Mon, 02 Nov 2026 11:46:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqUN-0000000GNon-3WVY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 11:46:13 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A95J4039352
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 11:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m3mBrDhbcxfP3/IX04+tIZ
	dgrJqn6b7HrBefYlPYicA=; b=NzRFsO30Ryp9ALm26cRedN2hD28g2VBAkl866F
	8VzIQpnPZMzEVt7Ijibk1rjcbOIuPySzM/gdjLFyx7NUSKdIEfWXk1wmFYjFynfu
	aPha00nh6SUYaJPCv/WT9627trx5tOb8jPnHj/AeB1seLN026eQ1ywwirBQX9lni
	cfam4I3tS4lIFsdpPXrwPhAH/WGHbxEr4+0kzJ1JRJsvtCpsrqBWo9u5+Q4bvn3C
	4lEyJhCqhy86onOWq1IJ6K3k3AhpKrdTkpOqHz9X4ld0dzhsDSUjrlyhBk6PeHBL
	qLcrrATrWyqoh3Zgf5kPy9xiBpSiAy2aiiTf34Lc2T0oGdBQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph18xsc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:46:10 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc694cb4adso520802137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 03:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793619970; x=1794224770; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m3mBrDhbcxfP3/IX04+tIZdgrJqn6b7HrBefYlPYicA=;
        b=frPT0hhox5dmVcfgMOC+zdXFpH5zqgySmHYo/IB+gHGhorW9SC4g9ZKcqDbRdWcCG9
         avfNINH/QOYHSl49ps2IrLIN3MHbTadqSLGdA7ZLh533b/wh8lId2hQHgwg83APkDLjj
         ZU3tdoi+MszZFwU8XBQWjevoRBBoz8H4sPMgtl8S6k5ZEYidsowBXpN2kUsAEqenamK1
         tY0M+ckVGcv80S9pP1AoHpe+ySZMAoU0+/w5sLZzzrmGPMqwxLIzTdmpo6n3bB0ysyH9
         zC3KtGE54fHDXU3FKtIUdg/hnwFy5GXJ4dsKvmOKHjia6QYPdQnXM3V1Cga/ymohX20x
         eobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793619970; x=1794224770;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=m3mBrDhbcxfP3/IX04+tIZdgrJqn6b7HrBefYlPYicA=;
        b=N2yLBJ1lwxQoG2T9QFce4ejv9mgH0k70NbS8XECa1diT/qe88HOEuwcFX7aiI9WlRK
         pcJkUfFi8WedjwY1f4dRVfdjrDyIVkIJjaOiu2Vg5+kscrTd1502R4vSic99L5lBRA5G
         9RIGKK3CcSRJYjANJSsVbslsD405ADKyhmkAH05UTGl3pKXei341B2PsG8J208QRZH10
         6IC0H5sf5rA8LvKwL+y3bkFm9tIA74vWvgWfp5LDQBD1EcXSpn0xb7JISGJhtH1d7rWY
         DEYF+I4cwj613M0ycjkMW2u/e9Q3G+Xjdv48VTT9lqNk+s/XLG+elIzyIZDIsnFtJIEO
         VWAg==
X-Forwarded-Encrypted: i=1; AKwUvBzuOmkWj8P67zx5PJno91BATh0liksHd6hjcsISWR3i0lWnbJe1fpkKda4HNGEZpOruWksHlpaaDp9TSNdoTsB2@lists.infradead.org
X-Gm-Message-State: APuU4Z+C945ZIblFlS5R28I3NUkWdZd+SRUBtT9inM/xPV2yncha09wA
	tfayhfFXD3Y52j3GkK6EIKwfbbfp8dqGoMMQs0ffzmJjTeK5CnbHkKx/z5fc2o/Ii0C8Odct421
	Usg8cLGbxfDE6HWWNJgWEju2/1pwXszMwTUTCWyiCcJSFfMmXiMPupK6yUbePh/QbrroqRvB6Kc
	JaWA==
X-Gm-Gg: AYBFou0gQJw6JhKw4K1YUOJarjcBeKq5PyYbkP7NjJRb874WjZTNg5Y2QDzgj188xJX
	1o6iheIlALjScQtchTBbodGg+vPc5zdBjmL0mA/dEQtFqnR6xW+rcdTknRw60erQp96lU20pm/L
	ZUH7BQ8OcIhixzsK9iQgcp7+raLwSQeZZdzxpI3i/NZK6WyNK+7S9lKu14j91JYD5ubHO68NScq
	I7oTa85twoQnNjiZTWcdDPpMx/MRGFbhx8e+ta1BK9GUsscdUsSCk4LHZ+5FrOjJ+YcxH3AOJKS
	kTfvoJcPAsPPEH1tBD1zNmg6zAxKOMU9jVnQYJpiJNfGlUJvXuko5+p08qctiZn0vUmIEOwc7SV
	hXGMySI8j7n+SZfn335MxN8wLwFPUqo4Th+yM+HZDhHY2O5moWqSOZqfFvgqmkx0=
X-Received: by 2002:a05:6102:50a1:b0:7bf:74c1:b606 with SMTP id ada2fe7eead31-7d07269b10cmr3718021137.34.1793619969965;
        Mon, 02 Nov 2026 03:46:09 -0800 (PST)
X-Received: by 2002:a05:6102:50a1:b0:7bf:74c1:b606 with SMTP id ada2fe7eead31-7d07269b10cmr3718012137.34.1793619969394;
        Mon, 02 Nov 2026 03:46:09 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b72715sm19226037f8f.18.2026.11.02.03.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:46:08 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 12:46:04 +0100
Subject: [PATCH net] net: stmmac: set XDP metadata length on the page_pool
 RX path
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-stmmac_meatada_pp_path-v1-1-d93cc4f9a864@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBN0FoFdJUImm2oWmqhEEN09a
 fkW/z9QOAsXGLsHMl9S5IwNpu/AHxR3VrI2A2ocjNGoSg2BvAtMlVZyKblE9VDam8WitYzbAi1
 OmTe5//EEkSvM7/sB+NAYDm0AAAA=
X-Change-ID: 20261102-stmmac_meatada_pp_path-0c1b9299e2fb
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Song Yoong Siang <yoong.siang.song@intel.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bpf@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 0sPBMad-sgM7-UH1vfoNNDgI6_Hr4Ubj
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae87802 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=hfst0zn1j2-VxDRcdEQA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: 0sPBMad-sgM7-UH1vfoNNDgI6_Hr4Ubj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX1LWcQb8ITINk
 OfAobyJatsnTYbY5XIacKzodczziyQgXoLz3GKn8qoMAyrVdA1znkt/LHGv0BXt/14QHO8BVIL/
 nCr8Y42DBSpLd19rc0exyhN7m5pFQpX8e7iCM+/RvaTv7WNVT38O+rQxgtIAPeQCXl+MGrN0pim
 Iwt+9t7cnCocWsNJvmspsLgsxztN8dWFTEeDK6l5QM3Fk2L+ioJ+j93Q+XTLNMk2KmhhUg9W3Wh
 n0cCCaY5Lq0O/fI1JWbQKtn40ttkEQLDeBgpLLXvyrdI55xX0J03Y13ZXZ+kfCfoOUT7VWGFbsC
 rcEAqZ4K/+lPSakcMbpabb8wB3cTDk2vt3U/a7Z6Q7tRxcrsWUOHME7yJiq2Nxl89VOoHrIWZoy
 ysVQ3RGuGERxi6pFbmaf2172Dq2UjRPHqwyt8H7JmGjoN3mS+OzOX5qpoS6CqOvmXQmLbteRSdq
 jcwiMN/t7cfRh1Hpqbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX8vZ/aHtRAos8
 JsFRHMrpBZkVaf81OqX4qol+XpGfYvuGP16mnQIPXpJYAMYJZRhCTGgla7+hyJmEs8/gGkBQKWM
 MuP/JnlD5Fs3ojHWGg1Cdh54GIyT8xg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_034611_997837_6E05623F 
X-CRM114-Status: GOOD (  17.72  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

stmmac_rx() initializes the XDP buffer with the metadata area valid, so
an XDP program can reserve metadata with bpf_xdp_adjust_meta() and write
it in [xdp->data_meta, xdp->data), for example to export the RX hardware
timestamp obtained from the metadata kfunc. When such a frame is passed
to the stack, the skb is built in place around the same page with
napi_build_skb(), but skb_metadata_set() is never called.

napi_build_skb() clears skb_shared_info up to dataref, which includes
meta_len, so skb_metadata_len() stays zero. The stack and TC BPF then see
an empty metadata range even though the bytes are present in the skb
headroom. The AF_XDP zero-copy path already records the length in
stmmac_construct_skb_zc().

Record the metadata length after reserving the headroom and adding the
frame data. No copy is needed because the skb is built over the buffer the
XDP program wrote to. With the length recorded, the software VLAN
stripping path can move the metadata together with the MAC header, as it
already does for zero-copy frames.

Fixes: e3f9c3e34840 ("net: stmmac: add Rx HWTS metadata to XDP receive pkt")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b038472b9817..f97f6dc08789 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6012,7 +6012,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		}
 
 		if (!skb) {
-			unsigned int head_pad_len;
+			unsigned int metasize;
 
 			/* XDP program may expand or reduce tail */
 			buf1_len = ctx.xdp.data_end - ctx.xdp.data;
@@ -6029,10 +6029,14 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 			}
 
 			/* XDP program may adjust header */
-			head_pad_len = ctx.xdp.data - ctx.xdp.data_hard_start;
-			skb_reserve(skb, head_pad_len);
+			skb_reserve(skb,
+				    ctx.xdp.data - ctx.xdp.data_hard_start);
 			skb_put(skb, buf1_len);
 			skb_mark_for_recycle(skb);
+
+			metasize = ctx.xdp.data - ctx.xdp.data_meta;
+			if (metasize)
+				skb_metadata_set(skb, metasize);
 			buf->page = NULL;
 		} else if (buf1_len) {
 			dma_sync_single_for_cpu(priv->device, buf->addr,

---
base-commit: 21f57ec673a1917547c808cfa81890485fffa03b
change-id: 20261102-stmmac_meatada_pp_path-0c1b9299e2fb

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


