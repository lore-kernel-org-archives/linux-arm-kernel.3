Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14667CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 20:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3xZ9op9l58SU7/YC9N8juWPncXRu5l0tsz+cj5uvOA=; b=3ZeHqh7xdRb7O2vrK6gPvsTjXU
	JqTscw3V3QGGsTrSsXstWTP/lHYSvXkEllMK2wdSydl8lWkngzqWahLILGvEj67pmGnKYmFdHmkl9
	h4S35o9TK08lCBQ7jJi7jl2ZBwp+6x9vD5srPKqKI+10S3LVfwHjtbcyhSzKe7IJarLbeZ+VY0bdY
	xQjLV0j/YkZWokiJvm3U1kIzjtflwBWTLf5POe78tUhh57R0FCOV8CDh1GDlcVaTSz2DTF/KGx6rM
	4mh7CclZTctrX4zxFyclgANxEPizQNhi0y9i8vwMJVux56UqOpLd3P3LAMwmiVcFeRH342P5lWrDE
	/6UI6R7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIX7P-00000006BwX-1VbF;
	Sun, 18 Oct 2026 20:04:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIX7N-00000006Bvp-0AIH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 20:04:30 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69IIU3ni3622205
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 20:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i3xZ9op9l58SU7/YC9N8juWPncXRu5l0tsz+cj5uvOA=; b=WyPRuKrB37c3X8Aj
	Jp1pnZjXYlcnbxq3+u/w3d3++aibxFILsd6NSKt2kKMMLfKBy0C9F7ZDVN39I2/6
	GEYgtKgKXtFHt8jjiekUKZlIYcHY3Nno0Ktq55Q1kJho3VB1L9JjRMILTuqTOl91
	HAf2eceZEQyEVOzL4oUWFwg8LK94sm4qc8CN2aSAClMZprJI4YJVhcm3zRfIJsh5
	qSs6w+gsL5GRyZJBHbGXPXcGRDEyVHZO2OfgVbqRzuX3DGVB/Mn05xcaM5C5JaXf
	vGuWsAejptzO0/oJ6k29Tn5OpUL8zjRbqrfIVFyunI7YWBBA8FXS8dazKbvTSICj
	fsfmUQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1d7ut7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 20:04:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35d4538fd74so5463199eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 13:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792353865; x=1792958665; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i3xZ9op9l58SU7/YC9N8juWPncXRu5l0tsz+cj5uvOA=;
        b=Feixvr6VX6zrLGAmLxXmxR/nLqXvTSJQQfegBmgbAtS05RAcWoZLRPrMj/QXyAqU/T
         +NwecxOyqsIEGOotWsfZ28jnPFvS4VGfpZb9uzdhuxRk21YwQDrNNbqRvEfgfjOmuR9J
         TAG+vMqbJ3XnkipfROUbp7hoG/HHRYcnlJBEu476e6B2LCDKbu/EmZMzIgZEB+9sfT5O
         6MPK0vihyHf55bBDZGBkub11JfHcPzwThXWxBIs2Q/SgGaBFVLcg8lno+VIwAKn1nFrO
         uKiO6LTGf8Z3lQMFVY84jXwLFuJXF3K0amfWHbbu/wkX4jjvyKuDXPN8HnHIe4TodBOP
         vKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792353865; x=1792958665;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i3xZ9op9l58SU7/YC9N8juWPncXRu5l0tsz+cj5uvOA=;
        b=o/cUUKE54ggug49bsIpPqekdcb531J5sgcogfMjLq/yrvQzYTwAb4j0Goiny3b+k0x
         qyrvZasIACPf5jtLBaYR1RkP059792jEbBIF9zDf1H/o1hUSHEseicBq8g7M5RDOSG0A
         kKGiBWBEukfzA40H/u1fQMNjm3d+nU5m7fw3B7xFBUVVuaZphjgUEqU5KtyaOgwSBlTs
         yp05JqY1dAWSf00IlgodoO2qz4x3FVk1KLv4DBsYj3jwJQUiVteQ+7SK6n3/Lhp7AklR
         R3NWvWRXiVgSlO3djSLjOrrBuf/KhEKcF0kyixA3kTY9TjTxY/Ol1+Vsv0a3V1FmtnQw
         RIJg==
X-Forwarded-Encrypted: i=1; AKwUvBwD2Npe8Io7Ve/LdHtvGjI7TgDl7nD/gpL6a+wXvxzI3CU1x3GyrrFKU4okdjQFWo0U7zsi3rP8BGZbxksg560g@lists.infradead.org
X-Gm-Message-State: AFq9FYLGS5LInswqu7qp/yVha4d1g2j7wtUw3rhdOMvlC61Nz5UkTYbD
	GFyYaqcRNXEF+BmxMD7slm3az8HnXfU4SUA+iubtqkq9oQmfMCx7gPj4S6eE+tAqH5XxpBepS4T
	HZtm+G7ouWcs5rKD97COFdCyvd9GYv0xpwx6XaAK9H6blmOek9EH5qqY9pHHsyyLWVtQi7eMbZp
	wt7Q==
X-Gm-Gg: AYBFou1Gojd1Cr7xqUsOlQE7Mo+4ObVg8/dC5tG+BgNUlWlSIe8AaDKsiPSANKRcNC7
	ZXFf+w0CuvEKVcA9FqXZHvcgbOUvpukz56zObTI8RNmzfjByCmCMbZmZBNr9OCxTqKYf3NPx1YW
	BOo0lrZQ8kbdFhQjsVH1GLYzoRmVoAfhe/tZuDEFe3KiuCv+OU5Ep9lW1HgkybzKpIpvalQ9M6B
	LHrkHYFVgWvgfR20hmtZuIOZYcsg+V94KsR5fk1OwBLll2VGT45mOCbyIRyaETikimE5eFPLGG+
	O0SLmzdo7kcCJvnNcigjf4PyAxERjzSGOr+hGHkFj9XQGVIzs/oLIevHOoI5wPgdWSELpYtpuCZ
	5TeGbgmfm7wWk
X-Received: by 2002:a05:693c:4003:b0:351:6409:25c9 with SMTP id 5a478bee46e88-361a2942adbmr9329007eec.35.1792353864854;
        Sun, 18 Oct 2026 13:04:24 -0700 (PDT)
X-Received: by 2002:a05:693c:4003:b0:351:6409:25c9 with SMTP id 5a478bee46e88-361a2942adbmr9328972eec.35.1792353864174;
        Sun, 18 Oct 2026 13:04:24 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm43680240eec.28.2026.10.18.13.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 13:04:23 -0700 (PDT)
Date: Mon, 19 Oct 2026 01:34:11 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
        kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, afd@ti.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk, richardcochran@gmail.com,
        andersson@kernel.org, konradybcio@kernel.org,
        alexandre.torgue@foss.st.com, peppe.cavallaro@st.com,
        joabreu@synopsys.com, maxime.chevallier@bootlin.com,
        mcoquelin.stm32@gmail.com, lorenzo.bianconi@oss.qualcomm.com,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v3 4/9] net: stmmac: qcom-ethqos: fix RGMII_ID
 mode to use DLL bypass
Message-ID: <atUmOyPnBUipmr55@oss.qualcomm.com>
References: <20261017-shikra_ethernet-v3-4-26a8beb44b8f@oss.qualcomm.com>
 <179232045490.3135.14337314664378256554@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179232045490.3135.14337314664378256554@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA3OSBTYWx0ZWRfX3I/WT6vwwm4h
 pzPhkvVyZxFqCdxhw3iFADKWKZOk5JQjxiz56hS+Ej/A+DynU9lvQx9MikGl7R3VoO2F3HtJoHm
 WMrIanIY7k/5FEgHY0t/BeGXTCe2ano=
X-Proofpoint-ORIG-GUID: VIrjKOpwE-E0YuNz56SBDVmmj0d1Bz4U
X-Proofpoint-GUID: VIrjKOpwE-E0YuNz56SBDVmmj0d1Bz4U
X-Authority-Analysis: v=2.4 cv=K4O3jCWI c=1 sm=1 tr=0 ts=6ad5264a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=rVh5EO9gQq6FD6a5X-wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA3OSBTYWx0ZWRfXy70jaMOXEyDj
 FrZ4peqWih9H79fzJta+7z5l+0Z9hdDgECFgAtxPReyiYkk/YFY73beIQNF05m7CFxb4VA613PJ
 wJe6tQu6U4qYY495EOz2zkwH5X5arLv4TBU4awcZpCcoJHdEA0d6DS1GUHs4+mLif3TcLl7v9ZM
 8p1QZh0cafNUH+L6hHo1kj49buWXFxj0NRWflghAGacGTiy8BkDaulZ9y2E7DpfHZHp26F/GYu7
 T0x19jAdM3JeDGPgeCZRGCCYTmPT71O2Kg7kP2ORxW9enCZyQOUyNuf9nIjheCil/h3TYfDbMfh
 JZ3yfYc2FXFyFdux4YjIb+znPty+JMaLsmpKr3DHKsV6tlm3sTVkU1YKIx452T+ZtNKnmYKuhXu
 QKTQGthr8MDRO5qc3ndv9EJhG+WK5RUwWFsVkwagFJbgh45CZHELTMlUT1z0hufg5bN0GhDG6m3
 MKV0Syn83IwU2boeeYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610180079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_130429_227533_8933682F 
X-CRM114-Status: GOOD (  20.66  )
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

On Sun, Oct 18, 2026 at 10:47:34AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 2 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] In rgmii-id mode at 100M and 10M, ethqos_set_clk_tx_rate() now
>   calls clk_set_rate(link_clk, 25000000) or clk_set_rate(link_clk,…
> - [Medium] net: stmmac: qcom-ethqos: rgmii_setmask() on multi-bit
>   RGMII_CONFIG2_RSVD_CONFIG15
> - [Low] The commit is titled and described as a fix for a defect in the
>   current tree, but it has no Fixes: tag.
> 
> --
> 
> 
> [Severity: Medium]
> Can qcs404 and sc8280xp actually produce 25 MHz and 2.5 MHz on the link
> clock?
> 
> On qcs404 the "rgmii" link clock is GCC_ETH_RGMII_CLK. Its parent's
> frequency table only has these entries:
> 
> drivers/clk/qcom/gcc-qcs404.c:ftbl_emac_clk_src
>     5 MHz, 50 MHz, 125 MHz, 250 MHz
> 
> On sc8280xp it is GCC_EMAC0_RGMII_CLK, and the lowest entry is 50 MHz:
> 
> drivers/clk/qcom/gcc-sc8280xp.c:ftbl_gcc_emac0_rgmii_clk_src
>     50 MHz, 125 MHz, 250 MHz
> 
> Both branch clocks have CLK_SET_RATE_PARENT. The parent RCGs round up
> rather than fail:
> 
> drivers/clk/qcom/clk-rcg2.c:clk_rcg2_determine_rate() {
> 	...
> 	return _freq_tbl_determine_rate(hw, rcg->freq_tbl, req, CEIL);
> }
> 
> So in rgmii-id mode at 100M/10M, the request would silently become 50 MHz
> or 5 MHz on qcs404, and 50 MHz on sc8280xp. clk_set_rate() would still
> return 0.
> 

As mentioned in another reply, I will update the series to use this new
flow for PHY managed RGMII delay for only SoCs that could be validated,
i.e. shikra and qcs615.

	Ayaan

pw-bot: cr

