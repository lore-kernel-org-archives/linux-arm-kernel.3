Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455ADC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 16:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2EVC3je5HAhssIAnNfZ+XqOXLnIfrV/oZD5AQQ6xe/s=; b=2IcU1nFilhhlEJGX9brn6HID0t
	TvvMEoDppNFTPYUs0R7+w7n0K0YjqfLkkqRvf0GLWP4kWiFUMqcdrVJp63c8IIdR192euKB5fdV+w
	OvPjTHzpnFsGmPLSSnyuVGYQCRKkjsxVo9bULRo6jN7hMquZKWcwDtcmPgXia+8yLlNc194w21Pky
	Xs4x61BbnzcCzyDhFSeu5XFPhVpBnqa5JMezvNw2sItnooqCIUiIKD2ugGDb7NkR6jBdhmFEa0MXq
	7+w4yn3g6c7sn7FfH4zeAnhR7kvxNYPmnINA2HzuDuuT3nYR4v52rNXJ9P9F+cJOlGMmb/SXgeZ93
	vdtSdAxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBc4o-00000005dnW-2Ta3;
	Sun, 04 May 2025 16:20:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBc1B-00000005dDE-3oLm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 May 2025 16:16:43 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544EGxgH029287
	for <linux-arm-kernel@lists.infradead.org>; Sun, 4 May 2025 16:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2EVC3je5HAhssIAnNfZ+XqOXLnIfrV/oZD5AQQ6xe/s=; b=jjIO5RsqjwOL8NcZ
	Qifcx92SBgVIeZQ9Nc4Pg+OJtmB3KHtixWVrzFuxZaztvsMUbkQ/GS+L6ATcygWS
	PYEgNHlYxtF1EcMtZZmS1rQ0GvxQ6yKUOAKsmSKqvZpXEjAwaGSgCP43qkU40OrF
	xORvhu2q9vZsoXxbpUqtC8HV7YkH3RkU0dawPX8ANytBXxaVbZpZL7/0NP8fnkRR
	LFAFhIzI3oElI+Ci8MBru8G/iCOOydwToIajdRl+I/Igiabr6clEnQdWYRp7kBJJ
	dyFmOjv0ldDhNfzX/xJ6NuRirda0kuANJIEKA7X28iD1BJpTc1+E3QnFoRO/nImK
	VfQCHw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbh7a5nv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 04 May 2025 16:16:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c7c30d8986so412027085a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 May 2025 09:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375398; x=1746980198;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2EVC3je5HAhssIAnNfZ+XqOXLnIfrV/oZD5AQQ6xe/s=;
        b=JLMKHCVB6ymSilIdh1tTB10rxgZopQI9xjGEg5viRM8lLhy53zusb7U9bPj0cVE8Sw
         pMAHOsni/5IaFHtrofIlzqgfO0G/W2/qbzkNCbxJFZru1x8/uLhea6Hm7uVDnU7hzn0G
         XnzQCnSxO3SNU2twKRrFRKYJB85jfC/j4qGEqXM+sy7eeDf39wQ8pFOFgPCsl5DEyvow
         DLOVnc+69qGT13XZlxVsxvCKo+k92R5ukGU/8JbePZja622+kDzRzTAh3BnHn14fiBDg
         /37ROQ5PChaD66oZC3ngAH9maAr/bB8rXx1H6SWw4iy/Myu4NUgcOcjHRNYdulEsUw7A
         dT5w==
X-Forwarded-Encrypted: i=1; AJvYcCXXjWZKtw4oOElIqU5nu6kZN8t9NXbu0BVAQwZBzwk8/Js6/Kd/d2OSQgDKeQYp6f3wniZa8Ea4YV4c5B3QtD09@lists.infradead.org
X-Gm-Message-State: AOJu0YwX2H1mlwjzypJneS9TeMT9WEH52MIfanCYbchHmPbZTAkV9cFB
	NvGAN0IpZ1ogKpbR0cmOMnVmw4rrk2h6W17B0qYDEOXUJKmQJupIWo8+tULQ4G+uc+SIS6Hrc+8
	xQ3b+7zfrqdHcV/typYVpF30OpMpFPJFgrWnxqLqgf0/wW/UyD6Fgi+O3dZF8L38nTk5J8TQu5Q
	==
X-Gm-Gg: ASbGncvTwHi1Z3osSZGaT+ailXQ4CMwiuPWdo1f+UPJBZy8RUhrrGuodqb8fIozJBwG
	IrV4jOkkM3xrq4fNeIBwMffIkMbYj9Ask+le/gSDVfwCSvsGeTnvJno2cM3N2bUv6cBWKiiBz8O
	6s8CvrRcSDjkyJv5pJSuyEYT3TXoSX+Nf8kqIhelDO6IbW8P1LjVi6uxfv4jzKwuq2774dhAr9y
	HKH4fUTE9pfd1AmHbOKIuTLQ6x1cAT9WStVph44esb3GhwquA36PKh4xmdLkl3qYVkXZd+euvXl
	lPR/7xtfPULXAau62hFcVIfRPHcwF9SgHjevTNSMXtkCQWqDzjSt7LILSSScJMjG0feqyp+MZqI
	=
X-Received: by 2002:a05:620a:371e:b0:7c3:d5a4:3df3 with SMTP id af79cd13be357-7cae3aa64e3mr573862585a.34.1746375398515;
        Sun, 04 May 2025 09:16:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiT08Hu2FwqUiAAbt7TpcAAf+6cb8td1czl+K5aq9kRsZS87wnWvgBk2BX0BgUjYPWiwBvqg==
X-Received: by 2002:a05:620a:371e:b0:7c3:d5a4:3df3 with SMTP id af79cd13be357-7cae3aa64e3mr573858585a.34.1746375398104;
        Sun, 04 May 2025 09:16:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94edff7sm1299766e87.137.2025.05.04.09.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:16:37 -0700 (PDT)
Date: Sun, 4 May 2025 19:16:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Andy Yan <andyshrk@163.com>, conor+dt@kernel.org, krzk+dt@kernel.org,
        robh@kernel.org, hjc@rock-chips.com, mripard@kernel.org,
        neil.armstrong@linaro.org, knaerzche@gmail.com,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v4 0/7] Convert inno hdmi to drm bridge
Message-ID: <nco27hnwykffzgirhocskltrkcds32tefkix23nfknf3e5m3zd@mkrrbw6kogsi>
References: <20250422070455.432666-1-andyshrk@163.com>
 <9503607.rMLUfLXkoz@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9503607.rMLUfLXkoz@diego>
X-Authority-Analysis: v=2.4 cv=fMY53Yae c=1 sm=1 tr=0 ts=681792e7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=dt9VzEwgFbYA:10 a=s8YR1HE3AAAA:8 a=iQVnW9HZ8WsgGSc_yxwA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: SBrkcgQVz5SGNZTKcGBte4a1KfYykAcu
X-Proofpoint-ORIG-GUID: SBrkcgQVz5SGNZTKcGBte4a1KfYykAcu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX0vtE6OqQg1dB
 RZn/CyW7IuwETNh/6+VwnMkq1EXxwNJYJtIv51xSfvHirjqaewbN+YxACDTzTAScEmgxXdNJhOP
 Z42F4daPgl1gAZMdC1041PO4MYKw0DeQs9+NPMIkrAZ9HmWGKTBGTJUO4BYKHYr6ZjPgEg1Mz24
 cr47nEJpgvP/8MvQelNh87ufc6VriEr4l8llr1oMgSVwQWdrqNc0AIOao8HSnoUR7Pz7wRg3dn2
 K6rYYwJ9wHcY1xuG5NMWCHo94ktI1lKEUQYW0qbwvUCt6o4saxIrNjBZwOGdqB5OgVWLVC46nPp
 ovCt7o0BgtF8T2LdgqaKe1IsitybqdgKUllL1rImdC6OjkK21jVOS68Tpp5F5h/qRDQRflx3hNd
 GTKF5WOEILZSrutLzh8Is6jCIIWQG8ZNsjB+FzzhNIvhhgd5Q4hvyehVMnT0d9PIa8qYSHiM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_091642_070195_9D3E74E7 
X-CRM114-Status: GOOD (  29.86  )
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

On Sat, May 03, 2025 at 04:42:04PM +0200, Heiko Stübner wrote:
> Am Dienstag, 22. April 2025, 09:04:39 Mitteleuropäische Sommerzeit schrieb Andy Yan:
> > From: Andy Yan <andy.yan@rock-chips.com>
> > 
> > When preparing to convert the current inno hdmi driver into a
> > bridge driver, I found that there are several issues currently
> > existing with it:
> > 
> > 1. When the system starts up, the first time it reads the EDID, it
> >    will fail. This is because RK3036 HDMI DDC bus requires it's PHY's
> >    reference clock to be enabled first before normal DDC communication
> >    can be carried out.
> > 
> > 2. The signal is unstable. When running the glmark2 test on the screen,
> >    there is a small probability of seeing some screen flickering.
> >    This is because The HSYNC/VSYNC polarity of rk3036 HDMI are controlled
> >    by GRF. This part is missing in the current driver.
> > 
> > PATCH 1~6 are try to Fix Document in the dt-binding, then add the
> > missing part in driver and dts.
> > PATCH 7 converts the curren driver to drm bridge mode.
> 
> After resurrecting my rk3036-kylin which hasn't sucessfully booted in a
> while, I could veryify this series, so on a rk3036-kylin
> 
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> 
> 
> I'll probably apply patches 1-4 to drm-misc later today, as that solely
> touches the Rockchip (and only rk3036-)side and patches 5+6 to the
> rockchip tree.
> 
> Patch 7 should probably get some attention by people more familiar with
> drm-bridges, so I'll let that sit for a bit longer.

I will take a look later, but on the first glance it looks like there
are too many things going on in that patch, including some unnecessary
fnction movements and define movements, etc. I would kindly ask to split
the non-functional refactorings and the functional ones (splitting to a
library, etc).

> 
> 
> Thanks a lot for working on all this
> Heiko
> 
> 

-- 
With best wishes
Dmitry

