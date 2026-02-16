Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C37E7BD87
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 10:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ldz6g6SovUoukXhKXBWKpNMY3TWItCGCHJsYS0M0OHo=; b=cA/tHvHDbu8hmgqRgADJl4Tm8q
	E3vma+ZYiiCotDImDG8BuU+Wdr/ITW15NrQsp3HAdn1sHjKgrN9zwJuNRERUNy7VLMwH8EvwdLZtz
	sZRvgOEDxlqU2gOuSb/Rqs5NH/L5OGl58vHXuhLZBlDo2oC5gWS/5TDfErHjbaIhufWqOc10UfKll
	e1DMipGlcctXoIemYmwzrkIv4xfje7Y3aHqDjUUqhC4JyXwhKXvtBciMIr2T7tas3B5XGsRnsQFtx
	ydSzFNPzr7Zy0cS4cgdU14NWtB5FcqWkinEGENlyACUfgssVPTl/2CXq+aeQsiZxG0Giyhn5cpiXi
	DoVkju8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrvuR-00000006Ly6-0Tzn;
	Mon, 16 Feb 2026 10:32:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrvuN-00000006Lxj-2JJs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 10:32:52 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FJkk8r2025204
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 10:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ldz6g6SovUoukXhKXBWKpNMY3TWItCGCHJsYS0M0OHo=; b=fVYKLm9e9AFd3YZF
	VC+Meh0tnjSUM3KUbTciYtCtohTsVrxtGzqlmr1I7d4Nz6xbzMyBoWAJlJ5YPe24
	mDGj0jS8tRXdQMDcZ8v3KYp22wTvAC8LQaZLQcYJiCTqsoKFpTMycD+wGGKtcAGS
	ENLTMXo+bWa2tSayF7TNHOX9OFf2iei15VTHTf+sk0404M7kS4mmfJP5K7eZ+diA
	3VlzgDeO9hjoJQ4Qke195hm0KPv98Mmrtm4Wqtqy8F65sRSreLmSQ+gXiuos00jh
	8MSFf3nUER9e/VK0K6x3QaQVOTIz4f+OrMedlzf6CdNVsbFqlZdMHcLk3WmHb5By
	bAlmHw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cahe64621-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 10:32:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb52a9c0eeso2145537285a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 02:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771237970; x=1771842770; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ldz6g6SovUoukXhKXBWKpNMY3TWItCGCHJsYS0M0OHo=;
        b=Q8zLCFQZgM1JCOIVgdG/Atm4e9qefThSa9DteTrwEB34HkBcQYBLDgOuT3Vv5jjGU4
         nRtLc1Rn2JPXER9pXgppBELF3t7UXwdGWDey1sh13xeY+4jf8CLBTv375J8DyTC+yeUl
         YaM8jHhW3fFj4HNUdqyfuUxfnn2Vha4NpCqmmX6Wz0o/IDyxyuqv8omMXREDb8Ilpuit
         ZQ1ljsqeKLbKr/EJKe/nKy/m/gjhmUAECjU8eVxHK5MDWlhtWAZwHOxGaZk6UHyyuEM6
         0eh7c6YoP4wrV05IhTtRBoAcYBX4Qd3owVDXniOsQFhgewcCCPo+4mODeqb4xBjobOO8
         UF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771237970; x=1771842770;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ldz6g6SovUoukXhKXBWKpNMY3TWItCGCHJsYS0M0OHo=;
        b=OHrlJpWACC3cgNUHwVujyCfxloTQzK5N/eD4jQu2gsOfxMWfDm+iBDrcxCoW/uadkG
         3kLNYASnD46hdm2ZpbFqcapHpE4KRET4UnRKswR9i+mgY+ps3guaHczKN3zms/4r5taq
         +vOKiLdjK7O2DKsdDwv9xvyt/pXBNuT68E9yYdf38hlUxR+qPNprgSIPWf7hm01D6Ap8
         PIOiDfBGDuq6qenhGcKLNXuamlXjLxJUSsIi9MpGwoP6ZpwukQjTNQ5IEvsNR+ZE/TBg
         wGsF8K/1/MrQZSaWhGEYftRLGL0iJK0iRqnddBc731saqNZRXhmMZkjVPvftSLWMLSKx
         Mr5g==
X-Forwarded-Encrypted: i=1; AJvYcCVFNuZdAyb6o3OI16VSPtOhKUUV59OWDaupR2VMm06U+wcjZE5MAbl/+22qV3/xkkWokbGsczsPuQiZ3DbyH0Y9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9lN26NJ3lo1Tm2Lw/D4eL/AHbAVGhcCoYSMY4USPgzC1kbkUj
	97qpUYMjuSFYEz4X0IOvIm1PWxtFDoPL+w7zV4PB9sx+Q6I5a4WsSlQdsDU/zDT+fX80+6e/QXE
	LQ6N6DzTuhwRmAJH0/qw1EkRqHLhFALEKmbbgzDHV4BT5WXtoQmbKvPNsvpv6DvSYdhBF2JGGbV
	h+xQ==
X-Gm-Gg: AZuq6aLRxtu4t+JZQ2LI4DpQPP9c5pghnyEsjd6bVDhBGZ5m01qee7UzPF3tH1cSC2o
	mx+RHJ2fNlOE/XalmrEB4a+XHzytZ+wHsQcjlezR8dqOw9/prb8V2GoYOjeJx0md/zD+/36yhs+
	M49xjg2+jHPC8Fpv443i4bcW2Op6iYp6AQ+B2Uu+WAPm0hhFoMbZXStrUoLN5hZoJmdjj8KMWzh
	bKOrT4472H6BZUA3caJiAkbnvIlfLRo5QelWxFN3uy6w5gy8nT20/5qu0dQWRQAc8loseQVgzd1
	Bc9/3K//byw+0WRn3EhzDFQjiNYkXFD8QpOGXBPNYSow81+iq8VHi0+tA/JZizCH6IlSMSkP/sS
	FbopSOZEHfgjP4NcirRv7i4IwHYIFk9VUy8Q0
X-Received: by 2002:a05:620a:4727:b0:8c6:a034:9226 with SMTP id af79cd13be357-8cb4c018c52mr990686185a.82.1771237969496;
        Mon, 16 Feb 2026 02:32:49 -0800 (PST)
X-Received: by 2002:a05:620a:4727:b0:8c6:a034:9226 with SMTP id af79cd13be357-8cb4c018c52mr990682785a.82.1771237968932;
        Mon, 16 Feb 2026 02:32:48 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac82f7sm28469525f8f.28.2026.02.16.02.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 02:32:48 -0800 (PST)
Date: Mon, 16 Feb 2026 12:32:46 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: =?utf-8?Q?=C5=81ukasz?= Majewski <lukma@nabladev.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Abel Vesa <abelvesa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/4] clk: vf610: Add clocks to support MTIP L2 switch
Message-ID: <jk6roonftm44qwnyxezhukdoqahrj2l7zaa55w35oq3uj4en4w@obfufdazx3wb>
References: <20260129095442.1646748-1-lukma@nabladev.com>
 <aYAEM8pcuumly+hc@shlinux89>
 <20260216101538.0aeae484@wsk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260216101538.0aeae484@wsk>
X-Authority-Analysis: v=2.4 cv=c5WmgB9l c=1 sm=1 tr=0 ts=6992f252 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=8AirrxEcAAAA:8 a=f3gpwmEmWHM1I7Tw-EcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: rk-Y8p5JKHnB8owK1CWdyx66qBGkNqv_
X-Proofpoint-ORIG-GUID: rk-Y8p5JKHnB8owK1CWdyx66qBGkNqv_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA4OSBTYWx0ZWRfX4QtTy9RoB7Um
 u8AfWTVbPPLxetRCzbSlD7VklkN6Eb2UySKEPSc1ScoN74uIOMn7FfGFHwplXzoYlcLraVJqSVP
 Tat7NN1Df5Hmz6P0yE+NA5m1aW+/ro9hhGjskN4gkAXNmMOTlW3qxYH1NVZMZNuQ2enGnSNmpjt
 nuvK0npxcWEnr0vHLxByuhELZ5Igo0w23sZSAb7HRWTL//9rlVKCpf/yUDki/rRUdbTuGBvK0oy
 NhRbA90twS/ItLrgOqb/8UKiXQlNhMjKTCVhSVISSbWYOldrxxA/odi9c6/jFk7uPA1ENuRi4el
 AAvgfrJZ6djEwsAWi6Ka6CCBkG+iMofzjYOpEhe9NhOqqEl94S0pcHVBfnlm/j/b1WthMtwWSJf
 Vshg/co3mtY5vmD5c1dwrrKkmMossDPcGQw7Sw8g9iVpaQkjeeMofcLWNceJdn0ZFrwCl1yQXTV
 fZzyxeK60HVI8PQK+3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_023251_801706_8A1658D3 
X-CRM114-Status: GOOD (  15.14  )
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

On 26-02-16 10:15:38, Łukasz Majewski wrote:
> Dear all,
> 
> > On Thu, Jan 29, 2026 at 10:54:38AM +0100, Lukasz Majewski wrote:
> > >This patch series:
> > >- cleans up clocks' setup on vf610 by moving VF610_CLK_END define
> > >  to driver code
> > >- introduces support for several clocks required by MTIP switch IP
> > >block
> > >
> > >Lukasz Majewski (4):
> > >  clk: vf610: Move VF610_CLK_END define to clk-vf610 driver
> > >  dt-bindings: clock: vf610: Drop VF610_CLK_END define
> > >  dt-bindings: clock: vf610: Add definitions for MTIP L2 switch
> > >  clk: vf610: Add support for the Ethernet switch clocks  
> > 
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> 
> Gentle ping regarding this patch set...

Will apply after rc1.

