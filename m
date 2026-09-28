Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AD5C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 08:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RA/vkNg7yN8i6zn82jKDCXocOVdLs/IMifjYk1p+w80=; b=hTMS3QjVrBgS2t4ynT4s3cbG7n
	6kExSOXaAIAn3Lv9H18lMGXizBnjPWyp8ksLYy7LHFFOEU7XgKLSgUSQzqqwgYXzJF74LknVzmrdP
	3p0SQ0vOK/CX9OHMlQGE1xrgpHr2YHWk66zuW9rxsmRmiHUGDXstxVBVrvrVVHDHsgLhmc3MAXg8w
	5nyekmbrOSXWEjIIn/B6pz+1USPwcqm++3RBat5vGnn+GnpxUhk+gI0GmlqbQG83omZT7QwCtnHuz
	qiOuht47DhBmTuFZheBN7y3UPw/6mzC6hbbNH8bNZYtd9FEUdiIqfvb55FgQbhXawMgl03MKJoEv8
	1WbdlndA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7Co-000000009wr-3xGE;
	Mon, 28 Sep 2026 08:59:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7Cl-000000009wG-3wIo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 08:59:25 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S80Xlw772384
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 08:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RA/vkNg7yN8i6zn82jKDCXocOVdLs/IMifjYk1p+w80=; b=O50Rlp6PfgjifU8Q
	iHxTBmTSP5Wh9vUyfvMJNUht+Bm0i3h+l3l/kgzlOdEg5D3EyV84RpqM4flKRyGm
	MCjcwkSoGEZ+YjPNIk2DnyPPa5GZTDn5ituQiuESayBl3whUyTH6Zta0JPQw+VDv
	0SFFq/33gE1WJlT1sqAUzBe9uNLzmSQ5zvYqeTU0SDf1zJBwdzo57aOw3k2TADBw
	nib8hD+T6jt5tgHJnTtma+5GbEe+9jl+EwAjlz3DbfNc5n3IUo8ik9RnPKUJAXfH
	ZAKKRCbRtcxNIOwM2yR8JwtGxTHskfKY8DQ5SV1am2lM9FGnKf+bN0cWO7GnJPW5
	fGlG6A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3dp5p23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 08:59:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so2890515a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 01:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790585961; x=1791190761; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RA/vkNg7yN8i6zn82jKDCXocOVdLs/IMifjYk1p+w80=;
        b=Yf5B6IXNiXavK18E2cKrA0ADw7eBu8YqPfEhiylRgyr+HO05O40NMRAjm3KpKAdBXB
         6TqZyNRUp6CBiDWIAz8AhIV82aZhK+9dG4EpBm/TWvWGzcDOyggZKmR9/0ZoYhVqgQ/x
         dkG/n2aQL8J3RB0UlTkRmoD6v8wI7vO/x7FGY8yyDwGGBh3cMVfi1nRPCoUt11Opvxyd
         b2gM8EHzENXLGy4AdPUxnFg3ohhFs2J2mtxQte60F6zr1fJJdFUyroGbx1lqk4QJem/j
         ePb6nqRbL/yZFjvM9+x2ANVHfxLt+dDAVQ17UYPIiGdh6oLp5aMaYckCbOxjqM19nmQt
         tH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790585961; x=1791190761;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RA/vkNg7yN8i6zn82jKDCXocOVdLs/IMifjYk1p+w80=;
        b=sul+Q1CmnVUay54ZVEGrKgww7JAIQKIAuh63EOoKLkj3DiU9eLQlSb4H5QjqrelV9S
         nwvohDprrzzXl5yXeueP5PloCpQFRnLjh4ETFCrhSspAOT0cps0AESGt022OBzsT6FKG
         nuSPR0e5SXUiJMqmb3XWRiVHWqLDtP/f7qwi9AfKh6DWXgLk95QqcS0WRq4f0nW53utI
         bZp3SFdiN8LGyVhPqt6PqLv+KOREFJ9avRPsdtTMrORVcMc3A37Zc60rJIAv0G5Zpulg
         yMUIMH5yGI6xRjRwoni1NOW1nwZnKCo1d/K3kIu3RdieseDSG/fcGaEF0OUztb+S0um4
         ufpg==
X-Forwarded-Encrypted: i=1; AKwUvBzeiwJJ6DpxAivK/aVH4WoFIClwjZ0X7ohsid0YVEe4yFFdSvO4gXHwdEPGzgTwkO6DhSlCBNpleT81bnd/7XP5@lists.infradead.org
X-Gm-Message-State: AFq9FYJr/5Z2UZBkRccshbGc7Xi6oKxc+CJ4W5cMq8lyw778TgcTgrMy
	rCeYjhi17CZQ+DmUmfU34C+jZ0fLA1DIl7KjGGSK8uOz0sWkFoSWXlDVwmAmZtDFo1CdCITvTYD
	bCeueE4TPp51G6K37Q4W20gsAJKwMmhuxVNMdI3xNvsjWDT1vjbFSMgRijXjRVRU8aKvYQO/xgc
	cr6w==
X-Gm-Gg: AYBFou0mX7ICZtTEUbhoudGS7Kd/iOANDG75fvGWwS4yz68bTwjQ+k9cwBTEMkDUwg4
	dJMF6hjwtbso+aX1uL4Q5QXzwwXTUzc4OG1K3G0KcOaUxFSAyEmPwGdefBoCdKd9Dou+4cbv89B
	R5FHYU9JizqLRlZBtXe46sVI6gKn6r3aOMAFy9wszxhKRPW/vcgxl4e8InZnvPdixUchYqwt7fl
	DCxN2wJDW+7c9/gDpQtMDgg4vtvZ50j6uZNVUH0cZoMOqkun3bVQkkCtW8LtuzNa+zhpmzl6zMS
	MwmLQwu9Hh1wzDhxBjKPbTwvaj/xBtXP7oZByXveQzWIub0YrYDgSUvY+0ph3c+gcKvft4h+R/8
	BISdTsSPbSZaOsmHZvQMh9Y7cVq7NyA==
X-Received: by 2002:a17:90b:4a41:b0:3a0:ea63:13f4 with SMTP id 98e67ed59e1d1-3a0ea631b3bmr4076092a91.38.1790585961356;
        Mon, 28 Sep 2026 01:59:21 -0700 (PDT)
X-Received: by 2002:a17:90b:4a41:b0:3a0:ea63:13f4 with SMTP id 98e67ed59e1d1-3a0ea631b3bmr4076080a91.38.1790585960815;
        Mon, 28 Sep 2026 01:59:20 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0e151be04sm13302899a91.9.2026.09.28.01.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 01:59:20 -0700 (PDT)
Message-ID: <db2fa5de-6b2b-4555-a268-1c4f9e736f24@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 14:29:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] soc: qcom: geni: Derive SE clock configuration
 from OPP table on SA8255P
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <CAPx+jO9fcvBsxe9yx9oK=0EXmpNwub5ba0a-TGk1WRFaRGsqpA@mail.gmail.com>
 <177884a8-902f-49be-8fcb-b2bec3ec7d6c@oss.qualcomm.com>
 <CAPx+jO8bXn2F3cWz87Ozjrh00E+a_UWBrHeUViTEkTL87JHW9Q@mail.gmail.com>
 <0f5494c7-c3c1-4668-a09f-d8c43d1c58b9@oss.qualcomm.com>
 <6c28e672-349c-49cb-892d-ec521b3004bf@oss.qualcomm.com>
 <ae4581c0-1339-4398-8d35-1d7611a0f47e@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <ae4581c0-1339-4398-8d35-1d7611a0f47e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNSBTYWx0ZWRfXx9LNX8EfI9Q2
 N/jif1u6Zw4JoCkBXhjxWVfw9JH3JKJUdXRI26y1wAxWWVd3irmjt2G2yPcG7L+jlpKGCYB69BP
 aPaMyfwFnk/QYu9YADPYyIvbfUHH/TT3DIFRhp94qPlwdJQ/YBUXTOwrOPTxxVIcKiqR3kCcLLA
 xOGP1jfKIHMoQoPkmfVsc9zkr8XjexOWkNuX2mIXEMS1G5jzHjkdar/6jZXAwAcz4hkYOYHaiIy
 ONqwFMP9DrkU5W+lTiP/favubjVg8MoJ8HPIl13Q0XuM0Kf/EXb18aBTL5hGWeEMEXcsZYTP86b
 0bEfxY79xMWB7+QSom/i8MJwM5i1noaDoaDxMRK//fxsCx6sz3bKokVaaL9mBIV1TVafY7zg6On
 M+VoQx5DLG+W5knpmivm2dikD/WKFXOs3FXQPSOxiCUgEnjYWL4JQnN9Lxi263//ujSIV4RzGCA
 Z1KjTGYVVNz2uncIPRg==
X-Authority-Analysis: v=2.4 cv=QsXLTlyd c=1 sm=1 tr=0 ts=6aba2c6a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=AjVmRg8o_XJH9waDQPAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Y0FM6c6Wy22pS7-9785xQKx5cPAwEdQt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNSBTYWx0ZWRfX+yhMFIL7Qr1U
 +eGhyBLBecVIdkolO/Oq3fgAmveHb4arQbQ3iFukF37V5Ped1kaHk+zItBJT5IBmRRf1mrAIS/8
 /aI4z8rbkuXmZLCwoBDm+/0queK8CNk=
X-Proofpoint-ORIG-GUID: Y0FM6c6Wy22pS7-9785xQKx5cPAwEdQt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_015924_115687_E511A82A 
X-CRM114-Status: GOOD (  28.97  )
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

Hi Konrad,

On 22-09-2026 18:36, Konrad Dybcio wrote:
> On 9/11/26 7:33 PM, Praveen Talari wrote:
>> Hi Konrad,
>>
>> On 04-09-2026 14:30, Konrad Dybcio wrote:
>>> On 9/4/26 9:56 AM, Ulf Hansson wrote:
>>>> On Tue, Sep 1, 2026 at 6:48 PM Praveen Talari
>>>> <praveen.talari@oss.qualcomm.com> wrote:
>>> [...]
>>>
>>>> So geni_se_clk_freq_match() is used by two consumer drivers today,
>>>> drivers/spi/spi-geni-qcom.c and drivers/tty/serial/qcom_geni_serial.c.
>>>>
>>>> Beyond the $subject series, there will be even more consumer drivers
>>>> that call these platform specific functions. As I said above, I don't
>>>> think this is moving things in the right direction.
>>>>
>>>> If this can't be solved with generic frameworks (clocks and OPP),
>>>> please clarify why so we can figure out a better way forward.
>>> The way I read it, isn't geni_se_clk_freq_match() more or less
>>> dev_pm_opp_find_freq_exact() called in a loop with an increasing
>>> divider?
>> Currently, geni_se_clk_freq_match() relies on clk_perf_tbl to
>> determine the source clock index and divider corresponding to
>> a requested frequency.
> So I think the part that blocks going in the direction I
> suggested is that the index and divider values you mentioned
> are then required to be fed into some GENI-internal registers:
>
> -- drivers/spi/spi-geni-qcom.c
> clk_sel = idx & CLK_SEL_MSK;
> m_clk_cfg = (div << CLK_DIV_SHFT) | SER_CLK_EN;
> writel(clk_sel, se->base + SE_GENI_CLK_SEL);
> writel(m_clk_cfg, se->base + GENI_SER_M_CLK_CFG);
>
> and it seems like every protocol driver does some NIH things
> to take care of that.. perhaps this bit could be moved up to
> the common geni-se layer (Mukesh, are there some historical
> reasons for this being handled in proto drivers?)

Just to confirm, would you like the clock programming logic to be moved 
into

the common GENI driver (geni-se.c)? If yes, I can take that up in a 
separate series.


Thanks,

Praveen Talari

>
> I think this may just be an effect of how the hardware is wired
> up - the ""DFS"" clocks that feed into the serial engines are
> partly set up in the clock controller driver, but then there's
> this bit:
>
> -- drivers/clk/qcom/clk-rcg2.c
> clk_rcg2_enable_dfs()
> 	/*
>           * Rate changes with consumer writing a register in
>           * their own I/O region
>           */
>          init->flags |= CLK_GET_RATE_NOCACHE;
>          init->ops = &clk_rcg2_dfs_ops;
>
> which is the writes i mentioned above.
>
> At a glance, plumbing this into OPP would require making GENI
> SEs self-consumed clock providers, which sounds no less messy
>
> Konrad

