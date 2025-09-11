Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AACECAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 13:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3TiH2ZKjnLM++Cw9wXPbgBqAvgKW59I/imntpSO2OVc=; b=Ge52Tv4yte98qYRma46eHA+8ts
	AcFzdQXX5zPnol0qno/cXnCBjFH3K6GlMrqDsh5Q+HDbJGVjVrCMf9pZQNuaef28cH7NsDxHpVN0j
	AgmyQqQySo+UtooAnqt6wKXlbNaNsVFlcZdtZoAadgdqpaVnBAm9xzrSG3M4Ue0rzaeDXhe1SItrO
	DyEic7gtQp2cVSDQyvAKnz9pI1u7MnTg614qQ7wZqFU4seM/ZPhGRCJaYt4QWdkBY+v9PjzGLWIaV
	9ckuEvJRyxpURi9oiZ+qVI+JaZClO/KjqnO7Vv5kI70AQLrUBYuzTG3F+ZH25QlzRPD78K5qv/xks
	YRcVNqJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwgxa-000000037kG-2nIM;
	Thu, 11 Sep 2025 13:03:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwgxX-000000037j5-3sZt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 13:03:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BB3B7X026648
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 13:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3TiH2ZKjnLM++Cw9wXPbgBqAvgKW59I/imntpSO2OVc=; b=DX1rhjO4qW5LD3Lj
	xLFCy7IN0NjCF1DMLY21jE9O+6EqCosul89a5kC0A7ZjkRHqCe3cl0wPl1sxjx6P
	vb5eKn/e7bmF6l10N4VHzgIhvgJmTHAg4kSN5t3K7lhiHzeNLYtzooWAi2Q5Gu0Z
	DqaoMBNjDK/Jxn5+54LdpbzJCA8iRcLEYGqnVTWojTGY7uqh3SJjs96+HNAHECzk
	khM9p7Z5d4BQxCGqgyrHoWxAsT7L9xpXT9Tho3t70j3w8X5dOjbgCP6aC2WZ9c7Q
	c8bw07+3fNzVNlS7aA/BAMF5n+6flBGOrO029BkW4MDsV9UhSYB6wAYw4wEbjoC7
	xqH52w==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0yn31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 13:03:30 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-406f47faa7cso11938515ab.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 06:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757595810; x=1758200610;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3TiH2ZKjnLM++Cw9wXPbgBqAvgKW59I/imntpSO2OVc=;
        b=wtWA9dWBSYwF1kmZJYck/2BxvDUzouYU7+RJ3FNd2BhTqnL7BqcDtDkRE+kopa6D1l
         PzXbjJ4QOOLsOE74tKMjiISab6iuIlSEjn2jaMOHXXhyTS1sJiBWmRutoGpeWt4dkEsH
         CdeLYT6BUW/U2Bx+0VwmLmV9a6aKLuw6EsUKUc/hyfyeiKFHGPoK003947GEChOguCfI
         4Gv3kreZoGty3paqRwEOeaSSTqzEwpOl37INXgFutXIQ8HGgz4SJ9cc4kESB5DkqJxEq
         Ajfl9bamelYBGB7AJ9QcYEdobrdko757dHWD0Uk2zuZfml//SRXFXSvB5PhwnNUcxXT4
         vDmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvoBsUcDbkhgVG/8GNLjhLTbJUFnB/70FrLGVAp/y0h937SZL6th1H21CTELl/Mo7IUmx+3FaxjnIKW7lEMslV@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwkf+YpCY1sLmCEEludilCqvZu3MB8dydnGD1gd9tUAa85cDDS
	X4H6a+6HyehJRSWjjAMOMtpSrQwocoDl2DY/mlgaz6hZkaXq3RQNcHbjvT/LxpwcTV0kJbGAx2R
	ge3kHd60Yjlshx6FoiiIkYiMvnmJ3a2PDEwdiNSPnTTXrTNkZye4h+Ha4stHChG6r6g95Hb6xDt
	BGvQ==
X-Gm-Gg: ASbGnct9ZCgquZX7Ac30Z3aj8aEwDkp1l0T7ReZQaYQkPEcxOS0P23qKWX8iJr7RtDU
	ZYsJfA38Fkqlz87k0GVZsODK6e705zkzr6mpT8i5HYyTw7bkp8MO2j2UMa9bhggisyBTlWBwElX
	XxBISKOtgc//Gh6/Aj9lr25+s/CGyCxu32ciu96oqhaAcOa386g5HGxhQQqJqc8pMH/+ti5ffQ0
	ZqTrs2YidRGuTd50NCxQqya3t+/+wPFvsf0zXu/MWinic0OtsMwxcdw8wkaqXrFS9MV7044JUQ7
	DrXuCh9yuK8S8cuozEaKv/JLqBdrrjbzrCWYRzmIXQQc9NkobP7ae1OokImSvPPjh2ztF+iEevj
	XWbOu18MArUFb5ch7/7Wu0kQ1QBWluV+I9OhDnFy5CqYOD4fXz/h1
X-Received: by 2002:a05:6e02:1608:b0:41d:5ef3:df2 with SMTP id e9e14a558f8ab-41d5ef30f0amr26828345ab.18.1757595809620;
        Thu, 11 Sep 2025 06:03:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJ90goZe3T4OOiFo+85Q/4C7S07Ofj1OLJoHQ2FlrHY8mgdsyHXVlJIJfdlAHrxR9sWtFSUg==
X-Received: by 2002:a05:6e02:1608:b0:41d:5ef3:df2 with SMTP id e9e14a558f8ab-41d5ef30f0amr26827705ab.18.1757595809121;
        Thu, 11 Sep 2025 06:03:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c3b612csm422915e87.12.2025.09.11.06.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:03:28 -0700 (PDT)
Date: Thu, 11 Sep 2025 16:03:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Cc: Vikram Sharma <quic_vikramsa@quicinc.com>, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: monaco-evk-camera: Add DT overlay
Message-ID: <gd7allvjkgbmqgc6pazq5o5u62tdkrogpf2r43vfkqfsptzybk@66i2def6aumf>
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
 <20250909114241.840842-4-quic_vikramsa@quicinc.com>
 <w54mpkzk7irjb7m5jiouxhj77czj4ex72oqioaph4o5qhcsay2@qjolctktsu4s>
 <8104bb41-e827-4daa-bc96-9b6678a9d345@quicinc.com>
 <3d26b554-727a-44cb-a1a9-56f49775ba3a@quicinc.com>
 <j475dpcflsibhrim44wjmtbfcfht5jzvptlzrj354oyjee5mit@wmfc6zmrkbfs>
 <0ca4f6bb-b2a2-4f98-a494-bb0507bafcd5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ca4f6bb-b2a2-4f98-a494-bb0507bafcd5@quicinc.com>
X-Proofpoint-ORIG-GUID: y3xUomBsmfi5hrMHqlO5aBk0WxdFxYDY
X-Proofpoint-GUID: y3xUomBsmfi5hrMHqlO5aBk0WxdFxYDY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX9z6KPNfao0zi
 vrsBKwI+j1KEVPWCUvsbDGTC3ikuA5Rht9c9rcsJvcM0Qn7i5GYOpz5nqLYGA88RA47i7fucV95
 MwYfHvuu/J53obqhkgGS0HzZBligPswRS8ahJcodK6opxIlcUPf9jJTuzdMXq2n/pSsYqVAv0rC
 87rN3f3zlf4V2RfTxmQnMmLSSBniSVO1l9nZFbl9HCS7z8bWm4/Ue1JHXlPukGaRw60vTKIq30g
 w2CqKvdNbI/HZ/voB2yEZqR+0LFqL71c843jJFccHiFSuKpSawlmWhe2ErYPG5hU4Lv1SXHRybE
 TgPKO7QHas+YMHlsHxNlyxle1BdXgqKqq+FSS/fbhpi0Mq7VXOpSK4+k9DnRRQcorGWIb2Pt1QN
 Y6eq92Ki
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c2c8a2 cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=UxSgn0eRCaJVYZHEmbAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Ti5FldxQo0BAkOmdeC3H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_060332_093725_EAE9B39A 
X-CRM114-Status: GOOD (  26.93  )
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

On Thu, Sep 11, 2025 at 06:19:02PM +0530, Nihal Kumar Gupta wrote:
> 
> 
> On 11-09-2025 15:38, Dmitry Baryshkov wrote:
> > On Thu, Sep 11, 2025 at 02:49:59PM +0530, Nihal Kumar Gupta wrote:
> >>
> >> On 10-09-2025 12:33, Vikram Sharma wrote:
> >>> On 9/9/2025 7:31 PM, Dmitry Baryshkov wrote:
> >>>> On Tue, Sep 09, 2025 at 05:12:40PM +0530, Vikram Sharma wrote:
> >>>>> From: Nihal Kumar Gupta<quic_nihalkum@quicinc.com>
> >>>>>
> >>>>> Enable IMX577 sensor using the CCI1 interface on Monaco EVK.
> >>>>> Camera reset is controlled through an I2C expander,
> >>>>> and power supply is managed via tlmm GPIO74.
> >>>> Why is done as an overlay? Is it a seprate mezzanine?
> >>> It’s not a separate mezzanine; monaco-evk does not come with an attached camera 
> >>> sensor by default.
> >>> The overlay simply reflects an optional camera sensor attachment (e.g., IMX577 
> >>> on CSIPHY1)
> >>> That is why camera sensor is configured in monaco-evk-camera.dtso instead of 
> >>> modifying the base monaco-evk.dts.
> >>> Please suggest and alternative approach if you feel this is not correct
> >> Dmitry, Do you agree with this justification or you have a follow-up comment?
> >> Can we post v2 with the same change addressing other comments.
> > The previous email didn't land to the mailing list, I'm not sure why.
> > 
> > Anyway:
> > - What are other options that we might support? Having a single
> >   monaco-evk-camera overlay means that this is the only configuration
> >   that we plan to support.
> > 
> > - It all should have been described in the commit message. Please update
> >   it for the next revision.
> 
> Yes, We have planned to support device tree overlay of the IMX577 sensor via CSIPHY1 only.
> I'll update the commit message in v2

I'd still suggest monaco-evk-camera-imx577.dtso

-- 
With best wishes
Dmitry

