Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D1CC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 06:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fXD2/4RoMwMAQOQGCSOHyCUpamVhGvGUtKHG2LOsDSE=; b=ZBHGmz3OLdV0uykAq1icUXUKJK
	oOivlfxhAFGg/TcBWl/K6FHKpWgSX7tNF/q3MP8Jg0o6p9N43/rXcizm5ek/W//Ao25+iYyGf3Z/0
	gWKVgajhtMtf/HQPhLLN49m0kpEPEIlromDNGjFd4QOK1DRSKCUKB9ACpsCQfZKs1vetjVgnCMFVU
	nnScbqlhyscHdsBzUaQzo6kZZbaDXno4AWQWhTlJkaIJrdoFJEj+UIC45vJEqblDCmUvpP0E7HoGd
	IWDaVVeZRZ5XP70HK4bIS0XKeKLbxcGZvQa0XDVaaxv3sZKgAQMtZyEz8+lsDkr2M5lNTNvgvKLsB
	QlPWshYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9etB-00000008ekA-3HQu;
	Tue, 29 Apr 2025 06:56:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ek7-00000008cnT-3AxQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 06:47:00 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqDaa004051
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 06:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fXD2/4RoMwMAQOQGCSOHyCUpamVhGvGUtKHG2LOsDSE=; b=bolIncu5OQPUuPaL
	qYylJxx/SL6MPyUEVmUMJy/rzA7MH3AT2sbSWoqguy0S73DIKGRMqHzUXcu7ltTs
	PIo1G/rfcbNcULKMzZ+o81pE8s/zmNuYgbtzQ00r781iuOMsjbGjz/dRCprBg12U
	P/k7AV5Fby1h0ZH7eRWEMw9xIH+fXi+uivf3sgPwR1WE82xiCH471mGI3pn18QsH
	0f30wJPw7kg74bafHZ8FqlJbea+LD8XSbXSqGJWVOCS42Ub1yU0La29G3Pr4QCGq
	h7joZdVkDcVwh2oCYymRA8Et6ewwbUjinyldzN27gllqDmBHRPVk+0Hdkvlgqh58
	tAVnbw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rsbagk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 06:46:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c955be751aso967183485a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 23:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745909218; x=1746514018;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fXD2/4RoMwMAQOQGCSOHyCUpamVhGvGUtKHG2LOsDSE=;
        b=V+j6j9PHZv9ErRcZk+nSVxR5g5FIlmVKQx8tzOmJT4NyrqshP/h0W5q8jdiHCrZSPg
         9N2++/yIn6UawO+s3DuA/jmb7OPZyAO0KTfL8lOM4r1Oy8eXDTJyA+1nFk9Z0N29BZkf
         nCv0ih/h+IA/rMM4nBfYKIGFtsAmsySy2RMVgEkGTqJfd1U9ENj72sVMwziOL78iXoZC
         KoUsBItEWo2EeuyZ5NrP/XNgAXxmSHRFgbOHbzMGJQMSCid2dUIVNRtS2XT9BrJ+vF6i
         eJ8n09meGJcj3jYo3+z1JfXwKY3jHuaVxPAHvq1XSGpqCUZjwdVxocsWOCrfV7cANe5o
         EsYA==
X-Forwarded-Encrypted: i=1; AJvYcCVh2NC33UPxW67ZGsqu3mrMj/cWxDpy/zuUVLDPy0rPTpaEsYT4ypHv/qMzkTrntL+pZ8ncPQY4XiiPbbKOfYWl@lists.infradead.org
X-Gm-Message-State: AOJu0YxWhNzyzy1PL6h9vNoC6047yuBVKK2q4kClxX7N6LUK0TzIsZcr
	3XciBUkUiey9N0oigVb3gfw1dn1Gm1p4ASnkSRdQrUBMHX71RaltrOAZLhxVCrXxW4O2VFQNoJL
	oalauZiDBi6VGgxY8JQxOQHAj7cnoCsgOtjJ4b3I/mwmN8gmq9ixnXXheqxHrpw448Tz4tZHt0w
	==
X-Gm-Gg: ASbGnctmFKm0y+NMAc8trQ0631eoUGNLsldSc8G9swlasF4osy0Aou3jcELQgksdpfo
	E4Fqq6spXOy8oUxaayUU8KAWhzGUp9Bk7mA60b3wRFFgmcGRrrbJRWnX3f9SZe7m4av1esJTUEQ
	m90fcqLSWICsi9z7hu/1bPZmmVQkUi8gqbQdXHuBGcSDvqq1NNvUyP4oVdEH3YM/8tzVJpyhd9v
	8eCLqHFBt1XIHi1z5MLXfmghjLeI/qXb853s9DvE1ZCmh20Rd1L7fvZMjVfWvQ++sOqspmWekUz
	rUBdhQfdmGFU3+MiW/5Q3zkbR5tHWaP0dGnUvb2G5DLHAz98p4bqugiQSIChmjxuZ4fs5skgWoc
	=
X-Received: by 2002:a05:622a:4184:b0:476:790c:73a7 with SMTP id d75a77b69052e-488682fcaf7mr32644061cf.40.1745909217936;
        Mon, 28 Apr 2025 23:46:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGK6Va6YvoqH/CzYGmylSrfBRs/HdUH0nb1egjkaNYM8I9FzI8kODYjY4grnbVXKRtCr8OiFg==
X-Received: by 2002:a05:622a:4184:b0:476:790c:73a7 with SMTP id d75a77b69052e-488682fcaf7mr32643841cf.40.1745909217649;
        Mon, 28 Apr 2025 23:46:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb8a03sm1791093e87.259.2025.04.28.23.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:46:55 -0700 (PDT)
Date: Tue, 29 Apr 2025 09:46:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephen Boyd <swboyd@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, Benson Leung <bleung@chromium.org>,
        chrome-platform@lists.linux.dev, Pin-yen Lin <treapking@chromium.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
        Jameson Thies <jthies@google.com>,
        Andrei Kuchynski <akuchynski@chromium.org>
Subject: Re: [PATCH 2/7] platform/chrome: cros_ec_typec: Allow DP configure
 to work
Message-ID: <o5xngdkolgrkjp73yhq2gwzyo2koztpqxm7scbf6mfym3biwr7@msvf67d5envs>
References: <20250416000208.3568635-1-swboyd@chromium.org>
 <20250416000208.3568635-3-swboyd@chromium.org>
 <03cb5084-38ef-4827-9951-f54880ca8a07@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03cb5084-38ef-4827-9951-f54880ca8a07@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA1MCBTYWx0ZWRfX37g1jl1fusEL Vmf9HZ0PF8i4JjkPSv1Sc0KlaWXAKBh94Yhbi5B/rmVFVWpHby4fLtz9I42MIlk0ztnMSccn9if jftmsw0ulCfVuHhJmp6TXK6ky/RcEz/YyAqgqOIgo+rUBjFLIiyCoJI7BhZOBIa4R0q7keOzqms
 eA46FPkggEAEM9ZOPQYLsoELDU8bh3fpcECnxAI8GZuVEziqRibO7RHWcoGYcWdKQVe4rp/fAWA gyFhFcTFp1E1+rDSrGNIyRFqTNTvA4IUdzaCy/qqZIVNRpTvlSwrICftIXO1rjMwQmshkfZsLBH 1PygQXB0Gk4mrfm/OwKEXOS1lmXxY3T/i00jkufNnuXddURcolmZgzheC0nAPxOW2F2d9Wg5sef
 K0t5EzPCsTxDVD7jmA9bp8PctgHClNPIizBo+My8NXvlYp5Wz2xdOkNl5bm8OfdAJt3BF6d8
X-Proofpoint-GUID: HzojpVCRnfbKP5P35LoXqYSvAHRqsULh
X-Proofpoint-ORIG-GUID: HzojpVCRnfbKP5P35LoXqYSvAHRqsULh
X-Authority-Analysis: v=2.4 cv=I8ZlRMgg c=1 sm=1 tr=0 ts=681075e3 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=cm27Pg_UAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=yEET-rYJ_iZV8nkrigoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_234659_799713_94D944B5 
X-CRM114-Status: GOOD (  23.28  )
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

On Tue, Apr 22, 2025 at 04:37:53PM +0300, Dmitry Baryshkov wrote:
> On 16/04/2025 03:02, Stephen Boyd wrote:
> > The DP altmode driver fails the configure stage because the status VDO
> > that is spoofed in cros_typec_enable_dp() is missing a couple flags. Add
> > them so that the configure succeeds. This has the nice side effect of
> > properly reflecting the pin assignment and configuration of the DP
> > altmode in sysfs.
> 
> 
> Fixes?

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> > 
> > Cc: Benson Leung <bleung@chromium.org>
> > Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> > Cc: <chrome-platform@lists.linux.dev>
> > Cc: Pin-yen Lin <treapking@chromium.org>
> > Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > Cc: Łukasz Bartosik <ukaszb@chromium.org>
> > Cc: Jameson Thies <jthies@google.com>
> > Cc: Andrei Kuchynski <akuchynski@chromium.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >   drivers/platform/chrome/cros_ec_typec.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> > index 6ee182101bc9..2cbe29f08064 100644
> > --- a/drivers/platform/chrome/cros_ec_typec.c
> > +++ b/drivers/platform/chrome/cros_ec_typec.c
> > @@ -531,7 +531,7 @@ static int cros_typec_enable_dp(struct cros_typec_data *typec,
> >   	}
> >   	/* Status VDO. */
> > -	dp_data.status = DP_STATUS_ENABLED;
> > +	dp_data.status = DP_STATUS_ENABLED | DP_STATUS_CON_UFP_D | DP_STATUS_PREFER_MULTI_FUNC;
> >   	if (port->mux_flags & USB_PD_MUX_HPD_IRQ)
> >   		dp_data.status |= DP_STATUS_IRQ_HPD;
> >   	if (port->mux_flags & USB_PD_MUX_HPD_LVL)
> 
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry

