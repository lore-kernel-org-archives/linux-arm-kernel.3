Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808CE606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 13:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SQfhDy8B;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GJtwWxEG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bCz7SjYA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/rk6zsEoSC9vyEa7aELMlRYShi+YOe7ujM2O0/y5nRs=; b=SQfhDy8B2Jwjw6
	MF1c2aV2FzDQhZVP3Cy7HGgAH1GOLizKcyfA3cPmGfFIvFDCqBM3xvpFWrUcyP21AMww21ZUrJdyd
	GGIBeLr1oxk3yKvhIwsUYLaQDUiGEdhFzvZn3AKM9MecR4xLdWbnCe1FdUH0aMH2T0cm5H4aDOqWt
	OvoYFta4O1+if8aQE886oLSK6A3OtYTVthKgBw3tKR+z27Qt0xmwd4H8J4yqSjqxLzS9BBKjhm3Zw
	+L8PgDq8vLGXVm7GeZaYG8vOjkaFuAKnNgTre6E57fPDetO654buI5JLwrRb1E4NTtMOdNu5lkzkN
	MpCGGQ2nGl4gBxmOgFSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhY3-00000004vsQ-3KB1;
	Tue, 27 Oct 2026 13:49:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhY1-00000004vpP-0EDD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 13:49:06 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdwpO2458090
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 13:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/rk6zsEoSC9vyEa7aELMlRYShi+YOe7ujM2O0/y5nRs=; b=GJtwWxEG9BWyuIF0
	OZmt83Pz8xiqShipwY/KqIKoUpMQ6HoP5r4/KEsv2rB8R/sUi0OUewC9yz/15ZJn
	JJTZgXolj9EWoGV5YaigdFNXeZeLAtrwZRTujVL8DJ/PDYTE8FCI024Mg0gn4skW
	XbYZEe5yMCqEKgU8ocUSTRlzzDI2veGGk/UJ5hdAVBnDTFdXR2R+grKa5GiN3Eyj
	sTVQXAXiL60KmQMl15YzrzTTqHVryVXUZjMHO4iUp1IX651O3TnjKpWAmqkzHslz
	RIMeQpP4ul6PYFhf8GcTZ8jFq8CsyS5u65piLhA0bLOcL+U4cq9Am5rNeGcMW2T1
	qfTaQA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbtajjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 13:49:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so974292285a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 06:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793108943; x=1793713743; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/rk6zsEoSC9vyEa7aELMlRYShi+YOe7ujM2O0/y5nRs=;
        b=bCz7SjYAYTGRZfYvy1TlDmPk9boyZi1cCYA2V0cTr3E4kYtvjjI3MYxDAZRzY/B1/8
         nMNOVAsPRUV06EggYawyNWlvRD/69Ev/3vh3HETRk3DiHmNNsazqgBuEOYSsVXky/Bjs
         9Va5jYW4zgbh4u1doa5oaOpXZOz6rp7hfsvvFPhkZ+fg1IronX4CrYfyCbqTeKN5UlD1
         /hy3nUwbeH5K4viqFFyx8KvmpHkmsVs2Rnu6hsg72QDUDmqUpzZxxiW1d0joZT63je9B
         XhNKsW39ZyXro94lh9KQTviiLJbK13YTeAjT5ZHDAiKWB1yNbyUE+ckorPZrNg7HYf5v
         Ojwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108943; x=1793713743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/rk6zsEoSC9vyEa7aELMlRYShi+YOe7ujM2O0/y5nRs=;
        b=0JgvHgTPA+ywMj49ZTtb87rElCrEXaK3dYv6UQb9vSZOvSMiw6hKfl1VtTcgFVdUgm
         H7ifNRgSUT2xwlK4sJW6qUDYqaUdhyNx2VoL7OtVOeZQAhFPVIM16Py3ZEXD27UW1Tpe
         j1i/jXN8AQDBq+32oI2CpnUUuDEtAN/7zQpwoKIrPtCBtpps/HEyFsiaVwRdRfWlgdkD
         fESjJlLUw3ICyprLbOIGMel0AKxfNN1fvILVlxXLybwi3NdEvc6EaajYJ7v1h0C+URNS
         PVAei12zFHX9BWmXWObIIRDZQM/vJNnRomhNgmTBVulj2404SjeXpHzS7+vLUmgiMVq0
         wPqA==
X-Forwarded-Encrypted: i=1; AKwUvByIe9tMVp7TbEZ/l52cHUAvsBM5FQwkFfYzf1TftkCsauP3BrjzQC/MWrjITaYvShj5dQKn51PuNFH6ZVBlfLhy@lists.infradead.org
X-Gm-Message-State: AFq9FYKusH/1mJYBh0WKbGVPBrolpV1lslaaJeJtyu3nEG/dVZf9wnpT
	iPawhPMCYNvBHE26//iM4zb2X70+WKKfdXpEa3tkjCnctbD8fFPQGBsJVfIku+tnHcnieDrd4Mw
	/dv3B0exlcLKsqyddSq2ym1wUDq3XvBbp5PC2lt/E004Eu6On0gYIbiLGNz3F08dqxRLjcIl+wZ
	iQzA==
X-Gm-Gg: AYBFou2Q8dtwjpPDVQxHg4VPL1WPuo6UIAOnZ2BZ8G1GaExxoRO/jbweb8jtwtcIEGx
	5lbb1IKjzp3Yh1cPbEBYEhRyDERFN5suC17zzuEjx5fPDRvyYwXhXSX/xGg5O2u8sxfAnAzEiyP
	IEr3DJEaQgt/PsNbaZsq9mW+u9MAtASbYPY2hRhqWXOFP9+dS5yMzysRsbvw3HJj/pjEIzD70Hk
	vvDv604Ch8wndd+LHD6MSzl2PRNXF9xA06gIVTYIdCJmQik/LZ085s8zCs4kA0mxUssyJ1hWBTA
	MlLJHUhXeunnsG6i8QJUr8/U5GnPKJWs7kyJEZQF6XSvEVUL4gAOFwWcrShBeQNtd/F7BYfhVMG
	1/LICxNgMQ7g=
X-Received: by 2002:a05:620a:27cd:b0:93e:c12c:fbbf with SMTP id af79cd13be357-940ef96ee50mr1550617285a.76.1793108943030;
        Tue, 27 Oct 2026 06:49:03 -0700 (PDT)
X-Received: by 2002:a05:620a:27cd:b0:93e:c12c:fbbf with SMTP id af79cd13be357-940ef96ee50mr1550612685a.76.1793108942481;
        Tue, 27 Oct 2026 06:49:02 -0700 (PDT)
Received: from localhost ([93.144.6.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e89cesm464714066b.13.2026.10.27.06.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:49:01 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 14:48:39 +0100
Subject: [PATCH net v2 4/6] net: stmmac: copy XDP metadata in AF_XDP
 zero-copy RX
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-stmmac-xdp-fixes-v2-4-10eae8a093a8@oss.qualcomm.com>
References: <20261027-stmmac-xdp-fixes-v2-0-10eae8a093a8@oss.qualcomm.com>
In-Reply-To: <20261027-stmmac-xdp-fixes-v2-0-10eae8a093a8@oss.qualcomm.com>
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
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Ong Boon Leong <boon.leong.ong@intel.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bpf@vger.kernel.org
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfXwVtTjPPmd/0N
 hMNLOLdyrA2BvK4ojJKJkuMCUCHAJK0AlvTtqsESXyDoyFxBxkN0CUB41+jUxk21641rfTkpglr
 XFZcttERxqvuU7n1pm5/GmzsIFwYQpk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfX7JYypumaOIz6
 H9Es4alcybCcWWE2wOfgJifjTnt4kxsfQlb/MMITou/2hH6V4Yiqwr6NCD4Vppc+tQ3gN4k1N9M
 97dGhj1nRRnshvkdBbtdn5OWDtOtL6hxFzi5CSGPm9lGbgC8idRrvh+pvqCHvQhr8OWB5mtzeKP
 Ul2LBWlRJvx2zo3fJlGPCLRh83+/HpSIx1yXDwRGlKRe9CiXKT6kEJjvs5VRvvmXYAZ0kBgoybM
 CRnJsmRdO71OO5ydjC8J5vgw3b6SJ094QKRjmkYjLC3I4c16IadI1CUVr5ysCT31x+GzoYLHYO0
 LBwv4viJZOseJV6J0iDV7aJu0sDcL1sBbgLyqinZmmIx2ZsFFNqd0S9gTzFU/01d33+CwiHkZ+d
 bwRtbEJLn+az1pgXVJepPD3vaTpasGDfvCldwqrjcv8qj+ZkKAD3mTxR28ReTW2OzrX4wcjVJjq
 80OXVQuyKNP4atdy61A==
X-Proofpoint-ORIG-GUID: PTaVt3BROrdFHgOgxixUfk0CDhOxc-9l
X-Proofpoint-GUID: PTaVt3BROrdFHgOgxixUfk0CDhOxc-9l
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae0abcf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=9RzD3mWewD2guqUcLtsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_064905_215243_248989D5 
X-CRM114-Status: GOOD (  16.71  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

stmmac_construct_skb_zc() reserves headroom for the XDP metadata and
records the length reported by the XDP program, but only copies the
packet data starting at xdp->data. The bytes in
[xdp->data_meta, xdp->data) are never copied into the new skb, so the
skb advertises metadata that is not there: after eth_type_trans()
anchors mac_header, data_meta points at uninitialized headroom instead
of what the program wrote.

Copy the metadata together with the packet data starting at
xdp->data_meta, leaving skb->data at the start of the frame and the
metadata immediately before it, and record its length. This keeps
data_meta valid for the stack and TC BPF after eth_type_trans() anchors
mac_header.

Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 71858af6fd66..d9fc2464a160 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5519,7 +5519,8 @@ static struct sk_buff *stmmac_construct_skb_zc(struct stmmac_channel *ch,
 		return NULL;
 
 	skb_reserve(skb, xdp->data - xdp->data_hard_start);
-	memcpy(__skb_put(skb, datasize), xdp->data, datasize);
+	__skb_put(skb, datasize);
+	memcpy(skb->data - metasize, xdp->data_meta, datasize + metasize);
 	if (metasize)
 		skb_metadata_set(skb, metasize);
 

-- 
2.56.0


