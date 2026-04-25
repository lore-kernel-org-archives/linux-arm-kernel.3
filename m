Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB8EFF885D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 11:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fH7QGZwbDCoLyO1bwt3VrYsmvxr//vAEUJI0SlOWzQU=; b=G8A+odNoVVWeca59MOp8A4EoQj
	EALC3+c/r3K1ttUKKPOiF3EZfl+8QL/nPedzLiEGfuVovWg8HHOVtEL8brQ6uptivyk1BtiHpPd02
	d/LcJ7PiZvu7SSUOd9liKtLAFvCIzrbBLGxTu/NeBThZxuyJO2gImPQ6310WKkC/74qLs31nI349Y
	s5LJzfogEsUO+3tHZYPagNwYCBqTzp5mCbvwZ0TlL2xv4vWpU55627sUmgPcKiUGSs8Z6RN3RlfQR
	pgYctTMPWCUCaLCfK9egvdR2GP0cTXV0JiuIwPF7m5hKLrn/kbpqN3juQ2+D4rLrD3CI6IquJjPKv
	TyJTpYmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGb70-0000000EOGU-2rtz;
	Sat, 25 Apr 2026 11:23:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGb6y-0000000EOG7-36Bx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 11:23:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3JiYZ1728137
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 11:23:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fH7QGZwbDCoLyO1bwt3VrYsmvxr//vAEUJI0SlOWzQU=; b=BQMfRPhJ6Od33set
	Eg/xsxtIu1Nq+/EPAJqY30KFa79LysRlUM3qSMP/ZqD0OuW3gBZk+TeDTwrwkhBD
	T6IjzSGwyRupreTPxrVeKhtvm5wE/TH6YX1vWk1ezY2iiR9yOlenKCqtQysT8sH/
	7YSLYQgsK1ACgEPuOp9qG7hN0lYzDPJCMwKcTGYHrQSyNUTjKExPXYaazh4x0r8V
	n+MtQgFkfBxGhPuPU0G0ry14QOJ3vDhXZK9RTsvKbKC/9s3sinkRfG+CVGmZSWQ2
	np4BY42cA52P4Y0rUOyxPsD4mabwETf2RzU1+IeMVPCLMY4lqJokY2FVJFTesJf0
	mZON5w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnkx8tkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 11:23:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d826ed6f9so106006581cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 04:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777116227; x=1777721027; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fH7QGZwbDCoLyO1bwt3VrYsmvxr//vAEUJI0SlOWzQU=;
        b=NMJXwTheSwYFo7fAFkmglH/k9TQWFFq6d2X8CoMgUgmkprMAKmNC0eucvj3OSlQMHU
         WzvUxqlleVgKOd8g64OWV3ZMp62sPZ8QbrSeRw2gGAaOa6PS9QI4wILuIQsgFjnuwZs5
         k0iex3jWUnQfDZh+P0qtBro1vB4a6lY0X5Cn2Lnrj9dJCFjvfGzPMQ1IuMZ6iRZMAnLi
         HSBvyuU2W9DvUNC9mHQ+uIEfDBd5sOQHF3/NfQLlK5S9+cQrf4PtjwHi39hX+9D8R/G3
         yedE0DLGKo7V8rmA+V/ulwUzw+dYGbJ7u0SQQYxt6zpgBv0um4KTKpJHeid0DRTyVCGW
         hhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777116227; x=1777721027;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fH7QGZwbDCoLyO1bwt3VrYsmvxr//vAEUJI0SlOWzQU=;
        b=c7jk/vSiUwZffFv/Cr9oaj5f/9xENB7R3kkZwuF5IFIY1r0HnjHsXzkzdgOvr/XxMY
         3aqY7u6y+Cilppy0nlLcJJLCQza8giu6fGA39hWpq1Z8HwQvCCNcSaLbrEM4sXktSx0V
         H30x0QpS/dlaFI9JjaVkcXQTzu6YuevlL2kSUsegeumzm6MMEbPXbxJLP+7i49lOvjkj
         MMD541kl2TCXkYbnErecHH4OkfUgStZJ0KjTtoPE/CbZpB4TwxrVeovXdTmaMaVlNdRr
         qcaVpGMk8GsFeFJayYdFeXXSmxb1BkV0mk6Et5PSu2KKTDGDY85wrLXAaJIhy/taV0R8
         We7A==
X-Forwarded-Encrypted: i=1; AFNElJ8Szn/C4Vz/fN4JZ4t7uxgOFiLpNa7tfLcf1aYSexIYp0Zeuczh7VmHqiTr9cW1WEsEVsKbGQnx3HCLaLrRjwAC@lists.infradead.org
X-Gm-Message-State: AOJu0YzvUFK3G+LkyQOek8PPkfGILvY5QdndcKWWRHPOMmsS/pYyacWr
	DnpCL7eUGYhuA+XKi4zk1ktMJysOXEYdWUZGGhCaaFyA0TkL1STkOXo5ttuN4J1FNdhDaTkTSOD
	3O+3IZf3drgEPfGMGxrnvFPncmMygg9lthiN3RkJ2k+jgYcDEM4tP94v2N/L8/D8MJAhlInGJm6
	slzQ==
X-Gm-Gg: AeBDievueulEUo77J/SH9JUgjLzVQlX3g7Tiqsoa8q6PaSvfOvGOUqt777T0Lz0nalB
	2AbWCPZjP31Qom6faQXpxpM1KRAtW35MlRNwK8YDRVNCBOoPqm228KGZyx0K1rP705ZIJCq27k9
	KYRY9/XQU8MpPJizgR6kSQGG1dpNKcbmC05Q5fJmep5Tmk2u+JlKWu0kXWeZh6BvfcVvXCbWeTz
	UZwvDIKi+xVhUGXn439rUB9mTg3j33JT5x6JbI+EztqfWRw46mXmKHpbHJVWRyG1uO6t1G2IYin
	rYuGxFL5n66sGLf58R1faEgJlCp5LOHv43HEFbs4Bc9+s5lA5lLImjWSNBEmRSHAEj8dNmL4cNI
	Y1KdnNySX2GwjDbh0Tpf0ykFDOkBJ9KYIt7ep02aQ472fzRXo0z90MV1qT8yfFwEwFWNcLTms7P
	8UfGE/dotJL3zCoErs16m9Rz+/Tov2q0SFSzgPHkmXn84uGA==
X-Received: by 2002:ac8:5988:0:b0:50d:9cfd:b01f with SMTP id d75a77b69052e-50e367967e3mr442519791cf.32.1777116226882;
        Sat, 25 Apr 2026 04:23:46 -0700 (PDT)
X-Received: by 2002:ac8:5988:0:b0:50d:9cfd:b01f with SMTP id d75a77b69052e-50e367967e3mr442519461cf.32.1777116226424;
        Sat, 25 Apr 2026 04:23:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a41abceab0sm6416323e87.61.2026.04.25.04.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 04:23:44 -0700 (PDT)
Date: Sat, 25 Apr 2026 14:23:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Lukas Timmermann <linux@timmermann.space>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Alexandre Marquet <tb@a-marquet.fr>
Subject: Re: [PATCH 2/5] drm/panel-edp: Add support for Samsung
 LTL101DL02-002 panel
Message-ID: <ughwlscd4iksf45rdxwcoavtzpusslu4afphfp5gr5rrrmdtu5@7eu65pg7hp2p>
References: <20260423-manta-display-v1-0-196f80c5673a@timmermann.space>
 <20260423-manta-display-v1-2-196f80c5673a@timmermann.space>
 <CAD=FV=VNvPtG_f1W942SKJfM4ptK8Wvd-nZs4geBCG3bO_A0BA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=VNvPtG_f1W942SKJfM4ptK8Wvd-nZs4geBCG3bO_A0BA@mail.gmail.com>
X-Proofpoint-GUID: teNp4Rw71Pd2JkyesvziY6NK5DXBef0j
X-Proofpoint-ORIG-GUID: teNp4Rw71Pd2JkyesvziY6NK5DXBef0j
X-Authority-Analysis: v=2.4 cv=TuPWQjXh c=1 sm=1 tr=0 ts=69eca443 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bsQV_sbQVq-5e8UBBKAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDExMyBTYWx0ZWRfX480ECIElCZnA
 YGPwUWBLnItKpBB8Oio+i6E3CjkWn7z1QzYFOOC6vjvFntAEZRVKzpRstw2APkw5uEltTZQAH15
 hLqVdtBU5tsxR7AEqAQO6rkwIXdx/N7N1UCIl4jjFfNHjvqiz2pAkpdgAnIPZ9an/Hme3lUtJnm
 IIiut32pHY9ImZAoAZVV9jP4++/BJsAYwRDS158Ka1SHSAtRBbI5UD0UoAAw/23xwxPSu5nq4ul
 rjZHhI3hxGPimuAkXEGH0M+5Ue7PboMjGWq1wWfYoyTukYmHGXg5mjzs30hIYk08ZnTJAZnu03z
 C/3HCr0eH+mzrHOYpsmRwmZCLTRv9lnNPYQ/AuMoBHezJMrdQNbDiV0KhMbVIBfxGqWf5lkfD2S
 B8aaBWjptT9JQSesK2RUTIJSk88dqTjgOfgmYbUeXgvgO6sh0npkaQx8SOlQ7eQ6tVrS547w+CD
 QFm4QxLrO0lyNTtCiVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_042348_967736_B162B7FB 
X-CRM114-Status: GOOD (  22.69  )
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

On Thu, Apr 23, 2026 at 02:49:53PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Thu, Apr 23, 2026 at 2:15 PM Lukas Timmermann <linux@timmermann.space> wrote:
> >
> > From: Alexandre Marquet <tb@a-marquet.fr>
> >
> > Add a panel entry for the Samsung LTL101DL02-002 panel, as found in
> > Samsung Manta (Google Nexus 10).
> >
> > Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> > Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 31 +++++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> 
> Adding new panels like this is discouraged these days. Is there a
> reason you can't use the generic "edp-panel" compatible? I know that
> the exynos5 driver is pretty old, but a quick glance shows that it's
> based on the same analogix-dp core that "rockchip,analogix-dp" is, and
> that seems to have support for aux-bus...

I'd also prefer to NAK this change. If the driver can't cope with the
"edp-panel", the driver must be modified rather than pushing more and
more legacy panel compatibile strings.

-- 
With best wishes
Dmitry

