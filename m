Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2685BC54F2E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 08:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tHPIepG7q7mc2xqprg9sD27w/5edJZMQOBa1WzER5So=; b=Hk2fClTN77OZz4W6STxc/sdso6
	o/hPKn+bJYNSAEqqB3OEelUI2ZtYqvzemHrZc6zeCOmDOAd6qXGIBk6rtT8Fy+sWd99IyoZ0AlGYf
	xZGMFWB5dRgl+AcMgh+9ukl8Pi9PKIeBjKpXPiSH52R9bnqYEpmXWtY11jatZh/6iMA7nwODef+sV
	diFldXjdUwjoR3JDmO9fJibVqCj9j73tFrD0ksIRn58tfQi7i8sNQ5nB1M0FmItNh2zZr3R9+jqLR
	fWBdAISrq2Ukp4JNJrtp4HrRRSGvIQSeyOXfDAI300VSyAKikl5gxbn/TiHz2qiu0CpZ3+kn19tKL
	Sjfp9hrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIk0w-00000005YLH-3YoC;
	Sat, 24 May 2025 08:13:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIjyn-00000005Xxo-49jr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 May 2025 08:11:43 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54O3jhDQ026109
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 May 2025 08:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tHPIepG7q7mc2xqprg9sD27w/5edJZMQOBa1WzER5So=; b=OU1yU/epswZPLPX3
	EaLw6wAQmJII3aCjx2G8e++6kSShC1uOQNWeZ7FyISn2eh49vSYnb9uPO/l6oTMo
	cSjjfkEP2cKScFD+l0XiDv997FNeF+qIby5KVSfIUNUrODDLvL1WV5dDZLC7e81j
	JLQJQJVtZDIH0wZlxdb3whIyQ36l1woQ7SS3lv1LaOmx6lqwWjLt3C252y7tmkpf
	gVoxXBEtmA+jRfK68RYdQYSjUWuHUnhenLro9YvyNlkMtEzWhwxvn+86rS9nGUgm
	Ft/sZXL/YCiQv5WtTN2rC8HmyJdV/muwiuqSvOwRR/v0RpAKnianiCdVQem5IOjr
	KqKOPA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g8rb1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 May 2025 08:11:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7caef20a527so177255285a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 May 2025 01:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748074299; x=1748679099;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tHPIepG7q7mc2xqprg9sD27w/5edJZMQOBa1WzER5So=;
        b=ZKCY3K1z75gwAZQO4kjL9u4C1hOyBYmbZuoaOWBKHH1MEfWWi7mUjn3GN6h1hqhkq+
         IEShP5VMz9iWnBVUo0HxyGPKrrGG/IlfaS+mfmcFx82i8M303r7/4a16HqnL4hIxy8QM
         NkywNbhN7ofYSyxNzxoUQh/vf8oljuTrfNB9KzxtXnTOLTyhK1tUsI0O7C3PB21QM1fI
         w1HB+FsWBGcuJG2eGdUPIkyRvCg24UAxFlL9L0jLdjGQqlrX7GPfWsMHWFshev2uuwEH
         mlnUpTigz8o02r7ZBjXLTf1D/tr0s9YP/rKyosQaLXh9qgfqJ4/j7+IUSaHo1j2klhOq
         uk6g==
X-Forwarded-Encrypted: i=1; AJvYcCX51DL6A/sJnsoZWpAiHo87bi/ZqTWD/QPW1oLpLl1pQp6REO9L1sx9qvkYUtwfQsYiOjC5cNT0fOlCuiPJDCjc@lists.infradead.org
X-Gm-Message-State: AOJu0YzIgY+4Tz0UZBvzyqbtVQegc6f1piUYCneOGZKO9Bx0yM3cR3FP
	Ccm5rGmPfga/GAw+npPI6cltABd4fgJpDWodgazWsTedcdShj6z1B83b32Zi3IutNpI0S1IbOi3
	oED6Nlgz0vHz9lx/fVinzPVVHY5RRbl8sKIgwAhwIjLlwT0CBJsVr6lrnW4wIERDkg/0JjvF0LK
	WRk0mAZNPwNj6LrdU=
X-Gm-Gg: ASbGnctA6bPMV/k1H13SEgccvEirWuprKkTkrgBxpIQK8n+X4SttdyjI3VrT+qhD3ZF
	0WzDmziQm8685mXZFC8CwKxRMRodAdSJxpK/3Y0uo63shN+qgBGZqLgWvU2zmuqzJ/gWR24ZLnR
	yEQ6Q0thHPN4U0vqS8us6TQNKUANJ4egWC5K6NU5wcXb/lG7Xn5x79+GQtj14+hj8MhSKMinDaZ
	Ysq+ZNWCriZFVHOPTQuXOBi8tz0Jm/vUhxF5lR8v7LZbIzUHifLpHfMawuHHBfZLJhNGH6G1Yrl
	de9vTzoomVM1I+TKwRT1ftl9J4FyUw7Ho5wDu3O1iTQeUR4vsgTrAZWTVL4fVlPxKJ9b7ixjvcQ
	=
X-Received: by 2002:a05:620a:f15:b0:7ca:f40b:f44b with SMTP id af79cd13be357-7ceecc44cacmr332738085a.50.1748074299691;
        Sat, 24 May 2025 01:11:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh+51bBBWaUmqP+dgjFmfrbkOFuigtqEW7bD1m0xToXs6orv1NCpLgTxWoAXv/SLi3H/a8SA==
X-Received: by 2002:a05:620a:f15:b0:7ca:f40b:f44b with SMTP id af79cd13be357-7ceecc44cacmr332735885a.50.1748074299340;
        Sat, 24 May 2025 01:11:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085b8efesm41722811fa.73.2025.05.24.01.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 01:11:38 -0700 (PDT)
Date: Sat, 24 May 2025 11:11:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, neil.armstrong@linaro.org,
        sebastian.reichel@collabora.com, stephen@radxa.com,
        dri-devel@lists.freedesktop.org, hjc@rock-chips.com,
        mripard@kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        yubing.zhang@rock-chips.com, naoki@radxa.com,
        Laurent.pinchart@ideasonboard.com, Andy Yan <andy.yan@rock-chips.com>,
        krzk+dt@kernel.org, robh@kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/9] drm/bridge: synopsys: Add DW DPTX Controller
 support library
Message-ID: <osjee6ibus3kuhv7oqqvki2wdxjotjfgcnxarpovvw25jiwhqg@uburpxawk754>
References: <20250403033748.245007-1-andyshrk@163.com>
 <20250403033748.245007-3-andyshrk@163.com>
 <2f4796ad.a2e0.196ceb908b0.Coremail.andyshrk@163.com>
 <hsrec7lguapfxdxulyncypdx5c2rzamcxeoj2kiojw3ukvi5c3@lwr6eriwoxdy>
 <7d4f2ae8.23f1.197014e386f.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d4f2ae8.23f1.197014e386f.Coremail.andyshrk@163.com>
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=68317f3c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8
 a=s8YR1HE3AAAA:8 a=rLSYf88_2vispd5-KzUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: qKeJNW9dPYW0mlzp3sCxZtsBY3zkcEYj
X-Proofpoint-GUID: qKeJNW9dPYW0mlzp3sCxZtsBY3zkcEYj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDA3MyBTYWx0ZWRfX/9qvrt7Vwq5y
 gmbJaiMpjUgM+2uGEPrzSCH1ALrtS2vt/fJibXakFnibNfiAZ/5mbScIikXx9WfpP3BgiPOA/2i
 0hD/83asdm+ecb5Z2rYHLq5oegiT7P5iXuxD0qG7qlf4Bf07XzGvHlvu9jmL8QRp7BflmOlYVk8
 bKh1WgNL4OnSavoFuR1r57WBTDd7moSu1AauGUBkcD0cRiBotKh2drJW4m1MMnIt5vXRbWSHWae
 8q7dHkK68kaH2HZ/t4vhG17XA73vQjc3zfV1eeFgFie4kf1N/sEFJXl7fvit6nPY4KKw3cOZZzN
 X/J3RkdbvUQM5jT64Jc1aAXd2bNMb8wsAstRKvsoO+GoyvWztTeJ7zr/rwtpbnvBIn6bI//9Tof
 ul825rH63DHpoWLNXPxsV4+Mv1+DhGSguWUepyRbwZk/FyxzcDPLtXd4X8PUamokxC4EXd3k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_04,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505240073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_011142_140382_43D7F214 
X-CRM114-Status: GOOD (  26.26  )
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

On Sat, May 24, 2025 at 03:59:52PM +0800, Andy Yan wrote:
> 
> 
> Hello Dmitry,
> 
> 
> 在 2025-05-24 15:46:15，"Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com> 写道：
> >On Wed, May 14, 2025 at 08:15:55PM +0800, Andy Yan wrote:
> >> Hello Dmitry，
> >> 
> >>     Would it be convenient for you to continue reviewing this patch at your convenience?
> >> Or let me know your opinion on this patch.
> >>  
> >>    There is still one unresolved issue highlighted by you in the first version: try to use drm_dp_read_sink_count_cap
> >> instead of dw_dp_has_sink_count. But there is no response on my patch try to Pass down connector to drm bridge detect hook[0].
> >>    I don't know how to proceed with this patch at the moment.
> >
> >Please excuse me for the delay. It seems Maxime doesn't like that patch,
> >but I do not see a viable generic alternative.
> >
> 
> 
> I still want to express my gratitude for your help. 
> So, could we perhaps first keep this part as it is now, and
> we can switch to the generic helper in one day when we find a proper way to get the connector ?
> 

Yes. I will take a look at the series in one of the forthcoming days.

> 
> >> 
> >> 
> >> [0]https://lore.kernel.org/dri-devel/20250321085345.136380-1-andyshrk@163.com/
> >> 
> >> Thank you.
> >>   
> >> At 2025-04-03 11:37:30, "Andy Yan" <andyshrk@163.com> wrote:
> >> >From: Andy Yan <andy.yan@rock-chips.com>
> >> >

-- 
With best wishes
Dmitry

