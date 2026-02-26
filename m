Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D607FCE096
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 14:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urofc3orCSX3lD3Xa99/h+MZ/sVw1Y2QisAYKWEofpo=; b=nxJQuwYw72FdIBLhKs3rIF66pn
	jMMG52GZMjLjus3W8YQ7SOAteHEURnc3S+LIKoHQwNWvSm6GtkZxzsJoD5642a5RApltH3q09kO8t
	fKAoEqdGO308Zrqa3puVk4hCO5GSMwmdi+i2kS3VDKG3++A+gfUL3u/Ero1WAsoJ+CB1NraApP3BU
	yZBxFfodY/HWclS8QpRgXOhetsuHlb5RmfNEXlaN+udzUebdv+Z2DKg53+ygsGNpfud3uc6YLGAtg
	eF666hJ86dSh6ny+UddHo+Y+f+feKVoi/dQNBs4iF7Xa8EGMgGpNpnKElsz+ZjZAwcxyk0KzxZdnV
	pSXwihfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcak-00000006Mc7-4AvH;
	Thu, 26 Feb 2026 14:43:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcaj-00000006Mbn-2s32
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 14:43:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=urofc3orCSX3lD3Xa99/h+MZ/sVw1Y2QisAYKWEofpo=; b=XdN1P6PHW87RzAHzvjwkYTQq2o
	5a3w0s7Dbn6lqAHclNN9MSm/nZF8vdrdGxfQF54h19ygYuGYVcFrRtzx1dF3G6B9wf6ENNZwomk49
	XoWKVNHirzwo0vC4ayN96komFDadoHfOnfk4rnm69EjdCruJZpconUlsaVgY2MoOUtcT5rB+Afx9Y
	1Ps2SRsETBvjDxvH+YlqFYixnmyJXUrr/n3zh/Gtrl0RIQw89sphRb5z4E+4NHdR/d9wu9n0hvRLD
	QTADqZakV/JCYREOA/wTP+U4TEeimms2SE1b/+SW8cBOw9nI23rnZnf+CLC2snZppsOKJnuf7WbOW
	Dfw5mfxA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcag-0000000BCwG-1BeQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 14:43:48 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QAKmT0906845
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 14:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	urofc3orCSX3lD3Xa99/h+MZ/sVw1Y2QisAYKWEofpo=; b=Hv+w9+1v/5KMtX5q
	eEV02TftjDlfno9pQubVjXu9lj8qO2PcVwInP+nxDXtijEUe2ojVu10BzzFdBsrL
	ievKXUjJm1s+Vz2dYGfIMR26Be4upZWBOZZzDNlIwrfOIc+FgzFrFUQqUXubIQNa
	RNWD+LxOl4AhBOQh4Ed7yf/7vOifPsItMTRcPV/8DkY43UrQbqoxtQ7gapB9nggM
	yLI8tobvXUjCzLI3KZLAlv7qOQYf11A6RZSY2YlbvF/P9g4xfoeUzcGQJnTkEQNN
	G0A1a5RI7nAqj8lbcKgrAy8PngVxXOrzhYlVX0iPPA9b79jsm1oFpfMNMp5m55Oz
	MbKq3w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjk2v11jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 14:43:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb50dfd542so70403285a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 06:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772117019; x=1772721819; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=urofc3orCSX3lD3Xa99/h+MZ/sVw1Y2QisAYKWEofpo=;
        b=DPm/o+PGpUYkfjkgGNYAA0ZcPV+E9vCVWLDgBd8e1LROWFQ7a6lYvdSMK6W9cGecjE
         JKSKUu2tA110cwTEKgKnB9kgFxar3xZNGu+2AivkgoMagXwVetCXxYFwATCimWGmRgNT
         e0FcAX8ULsy4fBbw5F+CZZUtf4D73UxXHZDzYlBSVr23I8/p7S4YRZB/z8RGKSchQhAD
         sEWYnt7dEaZZ24JQFbfunvxhxDqN4ie/jWU0kIqBauRqui84HpdzArIUdSgOwUpnOvVa
         3ZeQOne4qQZ3qPOzSgVGpJ/c9DFUIrUTVGL2W1n1p0z8HKN+nfFkrE5oIMJzGsHjJSL+
         anMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117019; x=1772721819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=urofc3orCSX3lD3Xa99/h+MZ/sVw1Y2QisAYKWEofpo=;
        b=M2Qixnywmjfaq6Ik6HqJHINYHJMvJV2E9RMFtfilBSj7THTtNg0HbrSGMwmnShFZ6w
         LpwNBEdjtPnhZwi9ZczZfSML71tUZvATmG1XPu4vzR9fzI6wBGqihj2nJSLGYie0wl+k
         dcOjk33Qfrm4fGzfFkd9pohHo+zV/7X7P0Y6p+PGI2zJe7FRQNbjhdrj9LdTA4KxFL8o
         aHMQonznflO5hVxFbJfkRoBqoHpcT52CTV4Yb0coz95r6jN5oGOyws3vNcyn6p1L5eqg
         ErlLBfhKPzAltkCsOTnJ56cgVrHv9m+iN0HM6XuRI6C4ruf2elFM+wxI/4V6ndraW/T0
         tzGA==
X-Forwarded-Encrypted: i=1; AJvYcCUmR0gl/nOQO2MuAeUGV4Y/aj/F7PS2P/Bqe1QLb5bebIB/QkfdfR5L23KIXPkSM6T/D6AsGb13zIbRymE3VThU@lists.infradead.org
X-Gm-Message-State: AOJu0YxUW0U4BfNunr2j1iz5eS7EMZi8zTKDeippsL5ic7lHLkYCNI/9
	uVRlME5DWiwKmmraywA6V+0+Vu0KjAzMCVxfcB6TZ0iE2+Dpd/jUVGswcf5y89OFYmAnE723DQt
	olD5WSkRH2VJLSAteZoaTd0aeAGanUNYvA2IAkc+lH/FvI0C+KHT2IYNobzXtKWyUP3ZlMvjo6f
	BfbQ==
X-Gm-Gg: ATEYQzy1xEThV3hWG1VN5+xZ/n6BQAWZkq1jEspGO64lng1+FSRzU1TRSpmlyKzEwiY
	5mvnYEwHrkLp9w+or9vIl63k3YH0/cXCKjKQhQEmaMQiWXnmjGzO2YEMTTVUVsPY6QhsmKDjfxY
	uuxULI67sbjQuTCR/voiKyRQtPVPlIYKcD/6r+iRC+GBtALo9LxmJA79Avq7VNkK0cB421Fpm2y
	l0CzVj0pFGl7BPSVipFsyDbxQF/C9ZdDmEFhjQ4DyLa8IcpFzSnUgNo7Giudl+mum4w6G0QNFER
	Q2DkltuicDhX5AhXVnc/OWU+01kAjzHUnDeM9g7o1qMmGq9WOSgtSt34Gb+NyeI/54aPGVuLjor
	BUViOpbLYjGmBAWrwcWSucT01JmeNTMBq7aKCgPmtJoJ2STJdT4OzkXw/ywEQ+vPvAX/j+6pu0X
	0A2Uk=
X-Received: by 2002:a05:620a:c53:b0:8c7:9e6:3a4e with SMTP id af79cd13be357-8cb8c935646mr1876740585a.0.1772117019186;
        Thu, 26 Feb 2026 06:43:39 -0800 (PST)
X-Received: by 2002:a05:620a:c53:b0:8c7:9e6:3a4e with SMTP id af79cd13be357-8cb8c935646mr1876738585a.0.1772117018718;
        Thu, 26 Feb 2026 06:43:38 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabd36219sm519402a12.3.2026.02.26.06.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 06:43:38 -0800 (PST)
Message-ID: <b2ace86a-85cf-4498-8c96-21c9a2fed2d2@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 15:43:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: lemans: add mdss1 display device
 nodes
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com, dri-devel@lists.freedesktop.org,
        quic_riteshk@quicinc.com, Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260226111322.250176-1-quic_mkuntuma@quicinc.com>
 <20260226111322.250176-2-quic_mkuntuma@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260226111322.250176-2-quic_mkuntuma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: T2IguYOdDBp0EviKfnGdh7CU0cxIUTXD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEzMiBTYWx0ZWRfX2WQafPPGjjP1
 93MNCejDSe2rDUMlrUtSkvZRB7pOrxOIxaa5Vyzp5l6JpeWu7hUzQmWaPCI5Cs81xHVjyFyornA
 Bc9cbXzvjwHHslZMZB7/d0+FToskGVtl735/RhlHSR4LFbKQxn5vdvhiF76utwZsY0wGuqMRf63
 bYtD8moLyKRnZUs0nz/gDaTWK5ExQQZ+D/d6rlx40TeQKqri4LKUP1DJJ09ylgJjqQHH/5r56D7
 xrqIktvZ7LHTiozW0QKwBNNYCc4Elaw/LrYb2M6a3Y+Ui/3RJRd8Nz3h0KQ85BB3ovbQFT06Vuf
 Dyafn2mJtQuxmx7tU8kJHgUD0pwAkJk1p+1VzaprBz2dUdpElZhiHoWFLfeBFvcjCgf4k1OCyBT
 XJpxNvFxzX+mqZxpklisDiUVNk7N9/36Tgf3ROc0xek2gHhmJFnl4Cf3qnPC3LiJl7z3UuBkgW0
 gVJHDTLppqdH9TqsKPA==
X-Authority-Analysis: v=2.4 cv=PO8COPqC c=1 sm=1 tr=0 ts=69a05c1c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=YQTEiYD7NngJoS-z9XcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: T2IguYOdDBp0EviKfnGdh7CU0cxIUTXD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_144346_733737_088640D8 
X-CRM114-Status: GOOD (  16.96  )
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

On 2/26/26 12:13 PM, Mani Chandana Ballary Kuntumalla wrote:
> Add devicetree changes to enable second Mobile Display Subsystem (mdss1),
> Display Processing Unit(DPU), Display Port(DP), Display clock controller
> (dispcc1) and eDP PHYs on the Qualcomm Lemans platform.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 381 +++++++++++++++++++++------
>  1 file changed, 305 insertions(+), 76 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 1da8e7fb6775..fd4d524d0890 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -507,6 +507,30 @@ opp-2553600000 {
>  		};
>  	};
>  
> +	dp_opp_table: opp-table-dp {

You don't have to move this table to the root of the DT, it can
stay where it was (now the nodes are not sorted:
'o'pp-table-dp > 'd'ummy-sink)

[...]

> +					port@0 {
> +						reg = <0>;
> +						mdss1_dp0_in: endpoint {

I'm sorry I didn't notice that before, but please keep a newline
between the last property and the following subnode (patch-wide)

Konrad

