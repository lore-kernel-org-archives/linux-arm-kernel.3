Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FA6D46621
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 20:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnqPiGTSrWOR/jtbptW/xEAGZ61GUmhLAaxKSCpQDGY=; b=aH0Tlw7kwHPH1WnI9XupH1PEfQ
	eJ+TgoWUK/wO4mTDoPqbHzK+wRNvTS2Al8ebezEAG46nDUBAxKEDA+bCz2qYIdikA67jx8AWT3Jb7
	D5KlEOBV1r9YDcDFsdxxFF8Q7uOKhIv82flmHh8NOdYjqNADFWGhoVrVSmD9h0vFULQnfSdMTHjna
	bWhFo4ld9lkZx/rnDIgBz8AI8yZinM/CCn8rJ1ONkq3plJY6cZ6O1IdEF2uhfWhS/7c0kLiJAhvC5
	LPiwsxXbnhIKp9T+WypcARWC5N8uvgaM0QAHC4Yp7yVtI/oMRf7G9D0SxfSuRb/e+R0vlRJbHPtq3
	5eWjkHzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgTnu-0000000D89o-1gIG;
	Thu, 15 Jan 2026 20:18:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgTnq-0000000D88T-42sB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 20:18:48 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYDFH1910065
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 20:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UnqPiGTSrWOR/jtbptW/xEAGZ61GUmhLAaxKSCpQDGY=; b=L2ENXbK0+HdbT0aW
	qh630rNPRRBgmQZ+NDacP8Y8KRV9R6tE387d8K+6PcL7qQdUscl28le7XJdyniNQ
	tUy73o4nBeIgHobUX33Q+L2773wlqBUXBNSMPtwpNh+9fNba5xQL2RNSALMsWoV4
	gQxSUFkNUj2eY52P5O1jA7BOyF4JEaa5Cwtbb5d0r7wruD07XjPFdJYocDAlsayF
	+RYUbxug9fUpNy3/B7Pkbm8zw78I8T+DiKdVf1G0OYSqsQBJtCud4L4YxCeovUUi
	hdYsEugxTAZCLNdnqnM1Tqop1M2OZ+E3X/kxdBH6X2mi6cYXBh6SkrTAhOh/RweP
	WZ6KNg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpxgn1ng4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 20:18:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c2a3a614b5so333104185a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 12:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768508324; x=1769113124; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UnqPiGTSrWOR/jtbptW/xEAGZ61GUmhLAaxKSCpQDGY=;
        b=eNQ/vRDvbPIwsy9NNPd9h+WpqhfdLp/d5N7VmDg31x7ieecAof8IJb8TfSsPQAfAPE
         sYRZghX5jf9RocDoXolH/qCkS5z/k/jnR6LNaTz9L/x7aY29F8PY2Dy2J6rTDeykoDgb
         pyo7JZtKcEtDWNbbYU4eIgGZC79dSTjiSTX19FhHqUyn7JnBa1e+vPwqYewg+p4XluUZ
         KM8qK4vYyrNeWslHOLEarr+EPfxzDHYyntzWBhrxYmvDmr9kRUH8HJWRQwfW/AayiTlh
         qxzT4ypkCO1O/ZuHCCGbMPyWTA4bMGNdoM0xrzGHBghnsIdjdDNC0s9PbUFvPQUnqvH6
         AEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768508324; x=1769113124;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UnqPiGTSrWOR/jtbptW/xEAGZ61GUmhLAaxKSCpQDGY=;
        b=A3RXwsxAfvTdKWPL68q3QMakdbHr+A+geIqx2IfvyxhJpe6K11zH+Cnkz9y05FB943
         1UrJWywmCR+2Xp/9+TEEh+NfsvIhuD1zPo5RW1841F9eWH+cCwLy6s74APd6PVHAN2Qu
         wrT3v82zIxwwTD9k79rq63WM/LYAWsWK5Y+UCWK02cIxr31DYpClLLXUwwEs7T3oQ1yX
         ME+ipZq+kpBLQKfptP3aPR1L5IffM+zvn9XWolIlDaa5bpjBy72Yv66T3ErekUDGy6tx
         gm996pwrix4604Cko+PRNldczUl/hK9mRttB89TKXUSVYVSpl4MlL5l6r32HGjFdn1Eg
         b13g==
X-Forwarded-Encrypted: i=1; AJvYcCUgUMLM+VqEsKAxCepST+T/0Di6IID1ptPFjUF31U4TY4Pd9Y70yW8KlxCWuvGn8nTvwE8CDDsT2sE59zxXjXzh@lists.infradead.org
X-Gm-Message-State: AOJu0YyOLijh9PiuXQEVRuKVndIYNJnhIhM3VVCHsuwuOlsGE8PaTTOo
	M6L1hq3ZrC/iuU+mp+H132mZhFzsb/Bo2qQ4KnAjrigISiJiJw3miDWTtayuGMG/tssX5t4nRuw
	MDVBBAe6020P5Q+tLx5Pz53x1cghSg3rLGtj4gc/JnkGjQ9/JDBuIiBZNOFCW7Na/v1WoLpTDR+
	/ZKtmPiFdtqg==
X-Gm-Gg: AY/fxX7VlkXl3rpBaigXJJJqksUan0rrW+hAJlGnVADRdPiu0vsIxrzbEH+Xge7rV/H
	WcJGLQm6X1HMLbkabEe44jIFPL1FiMmn2KJuqJXMeNaLrKJ2XJ+Fqfr6HB4LC5QoFitCeEHaK6+
	p1EUUxFJCxqZ//0FkGWj/AR15/yGm1HjTD9mTZGxF/N8YEoWXWaJAqMB80dNNnzWiFW67582Qlu
	qPK+yK60CjLET1aI6XlEccdPJYjl/K6NKJCIeU47DZQf8W82Pnxz3QiRliytkqm1VxuVCcrceMh
	NgB6TLrLG7SWPgq3ndcYa0DuV9wjm7vw8IHT2mncp+4GkEzTT1CRGDiRPDD7XYbXQm0vhlR4O/T
	72Tipk6tk0yQysbpDdqHpUANcO/ktOICgCKkjpDgPu+rfTa+nrLJU1XI0Vkvbr/mAleT3hK6HVn
	mhBow14DsTnwV5lhrUEaKWOAo=
X-Received: by 2002:a05:620a:31a4:b0:8b2:62ae:acba with SMTP id af79cd13be357-8c5919e2319mr575787985a.26.1768508323444;
        Thu, 15 Jan 2026 12:18:43 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:8b2:62ae:acba with SMTP id af79cd13be357-8c5919e2319mr575784885a.26.1768508322960;
        Thu, 15 Jan 2026 12:18:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384f8a1d6sm1416691fa.40.2026.01.15.12.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 12:18:41 -0800 (PST)
Date: Thu, 15 Jan 2026 22:18:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <ebm6tn3swrzqqzp5qnd7zkasqxo4nqcz2gt3w7j6sxqx2ryyn4@pwrkiumm442t>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWY6kx8Bwa_2azIl@bogus>
 <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
X-Proofpoint-GUID: BOWnYCtNqB9HA49lTI8vtg-bf3VMTW9B
X-Proofpoint-ORIG-GUID: BOWnYCtNqB9HA49lTI8vtg-bf3VMTW9B
X-Authority-Analysis: v=2.4 cv=ANDFHcx+ c=1 sm=1 tr=0 ts=69694ba4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Oh2cFVv5AAAA:8 a=2_JQiIDWNJ96xn4SNR8A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE1OCBTYWx0ZWRfX32oo5Rnp0vRB
 fTtMF+GUBUnCaYbykeMVB6wlkZQiX5lij7ENNUvT64oW2UN79grjQ5/wgmwaIt3VcloUIivfsrO
 +YH1nAMIfdUugI2DGNaaGLbmkXEks3KDvwDnSXGZq+79/q8KIXptLoXDoA5tp+xV66AwjmQT4Yr
 +u1p8vOhNpsMBBAeB+FXnQHuhnrOTEN1j/3kHQW4VQ8KbxvgdzpQGUMvS30h0XoEr0OpJMEgR80
 0RzhRYd2yYBXrGngANcsZpJELNJBUXb/n0MQrg8E2d7qRy1ILMW7f8rO1BKMOOYp4YnAkOahKh1
 E+n2EfnufOt66DqPnXxISZLS1LnV2A2WfPd6NVXWPk3zIQ8RP2VZUx5W2sNbeGcQMl4ohj7Yub8
 hc7ZH4ji6iPPkM5YamSLYbDnEnLJzjIcjsAbh5WOqQYDJj4i0jFCjMtH0xbmJsc3bbOiSxUZfsQ
 DA6uwGT+UTOl12ki0aA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_121847_146879_C2621099 
X-CRM114-Status: GOOD (  52.17  )
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

On Thu, Jan 15, 2026 at 10:42:51AM -0800, Satya Durga Srinivasu Prabhala wrote:
> Hello Sudeep,
> 
> Thanks for the feedback.
> 
> On 1/14/2026 1:01 PM, Sudeep Holla wrote:
> > On Wed, Jan 14, 2026 at 08:50:23AM -0800, Satya Durga Srinivasu Prabhala wrote:
> > > Hello Sudeep,
> > > 
> > > On 1/13/2026 4:29 AM, Sudeep Holla wrote:
> > > > On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
> > > > > The ARM SMCCC SoC ID driver is currently enabled by default and publishes
> > > > > SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
> > > > > 
> > > > > On platforms where a vendor SoC driver already exposes widely-consumed
> > > > > attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
> > > > > the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
> > > > > of a vendor logical ID like "519") and breaks existing userspace consumers.
> > > > > 
> > > > Instead of relying on a vendor-specific SoC driver, we should consider
> > > > disabling it and using the OS-agnostic SoC information interface provided by
> > > > the firmware.
> > > Would like to add some history here. Vendor interface existed [1] even
> > > before
> > > SMCCC SMC ID was introduced [2]. And there are several user space entities
> > > which
> > > uses the soc0 interface already.
> > True, but that's not the main point.
> 
> That is one of the point which needs to be considered in my honest opinion.
> Vendor driver existed from long time (v3.10 Kernels) in Android
> https://android.googlesource.com/kernel/msm/+/refs/heads/android-msm-angler-3.10-marshmallow-dr/drivers/soc/qcom/socinfo.c
> and lot of user space entities in Android depends on soc0 which is not just
> limited
> Qualcomm user space, but also, 3rd party ones.
> 
> > > > The presence of this interface strongly suggests that the
> > > > firmware is designed to support multiple operating systems or software stacks
> > > > that already depend on it.
> > > That is correct. We started seeing the issue with user space when our
> > > firmware
> > > started implementing support for SMCCC SOC ID recently for non-Linux based
> > > product.
> > > As the firmware remain same across OSes, user space is broken on Linux.
> > What exactly do you mean by "firmware started implementing support for SMCCC
> > SOC ID recently for non-Linux based product" ? Does that really mean that
> > you can change the firmware for Linux based products ? I don't think so and
> > hence we are in this discussion.
> > 
> > 1. Either it exists in which case deal with it by disabling vendor driver
> >     and/or fixing the userspace.
> > 
> > or
> > 
> > 2. It doesn't exist which is not a problem.
> 
> Allow me to add some more details, so far, our firmware hasn't been
> supporting
> SMCCC SMC ID.  Due a requirement on non-Linux based product, firmware
> started
> to support the feature and same firmware is used even on Linux Android
> (android16-6.12)
> based product.
> 
> I would say, firmware started supporting the feature on our newer product
> instead
> of firmware being updated on any older products.

These are two different cases. But as you explicitly state that it is
only for a new products, then you can fix the userspace to check all
SoC devices. Broken userspace was never _shipped_ on those.

> Now, as the user space remain same and is relying on soc0 interface already,

Why does it have to be the same for new devices?

> user space is broken as SMCCC SOC ID enabled by default which gets compiled
> into Kernel and takes precedence over vendor driver which is a vendor module
> in case of Android.
> 
> > The userspace
> > tool seem to have made a wrong assumption and can't expect the kernel to
> > magically fix the issue here.
> > 
> > E.g. We didn't disable HMP(a.k.a big little platforms) as the assumptions
> > made by several userspace tools(e.g. lscpu IIRC) was wrong at the time.
> 
> Sorry, at risk of repeating the same thing again, the user space was using
> soc0 interface on Linux Android products for a long time base on vendor
> implementation. While I agree that, user space had some assumptions based
> on vendor implementation, if not disabling the SMCCC SOC ID by default, we
> should at-least have a way to disable it (via cmdline) based on vendor
> requirements.

How will that command line parameter be set and passed to the kernel?

A better approach would be to fix the issue where is is broken:
- Add a switch to the firmware, letting it ignore SMCCC SOC_ID calls
  (like it was beforehand)

OR

- Fix the userspace

The kernel was never broken, it is not a kernel change that introduced
the regression. Why are you trying to change the kernel? If it ain't
broken, don't fix it.

-- 
With best wishes
Dmitry

