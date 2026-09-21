Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C265C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 11:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tEMjD4QABtsqcKKWJSSUlZeCK+qOD0w5nqpSa9w3MOQ=; b=zy2a99vZhoSDztWP6frMzO6HcW
	qdNgyPmVnHRw0q/nLD0F60JKMPCfSRimY1BDG4DqSeyglsnVlpHUY2QytGHZOl6tak4gEsRB3cCK8
	UgHFmDywfuRJEszyLHzzyGC53hEZgcph6QDkmblI1N9B6jYkhIZPn7Ygq5tHKXigPCxpoZTHGmVFu
	EK+fC63D6nt1cez49Cbc2dS4Yv+STAjV1KYpK9xkoHfB6stqI3Am6vdMUscPSuA3pQDF/taCJ0g7t
	lDv6H9Hb72KLQnhhelN9yTjpNPXtyWbOnwXM9jY/mNJcwRz0UFgsJbiz1Da/rIl8vzHC4UL4A2Y1y
	8BRXI04Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cae-00000001ych-3spi;
	Mon, 21 Sep 2026 11:53:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cad-00000001yc5-1G8x
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 11:53:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tEMjD4QABtsqcKKWJSSUlZeCK+qOD0w5nqpSa9w3MOQ=; b=ijstm9nOoSzDl9uiOiF3Q1ECIW
	Bc5Oh4gz9PcJQNM6zk/SgelNR1GgHIWPBfrDiwB1x6yrwhav7T5xLlgiufhd2s10MP9Mv+NXIAxEH
	XuHmOYaUQNwWo3a7UiOp0LqeftfcfSJAXJ8dO/dJp6glbUbhkcESPuBd96BJuRDbZsXf04jbZ7DGO
	qi7PXP9n2KO/lKqNsr7xh+2K5yXVJACp37q7ZVNyzDBjA+PYLgIzBFl+m3jNPVsMOZvpnbv14OkAJ
	qZ6LTzoHa/h6XzvCY8geQcLi/vo9NOIptl+RCuNRhb4acUkS4RvCPJxlSQsCP7WLPueG4Q0csLLw8
	ZliJDFAQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8caQ-0000000CEyv-1K6Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 11:53:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdhNE227633
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 11:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tEMjD4QABtsqcKKWJSSUlZeC
	K+qOD0w5nqpSa9w3MOQ=; b=SQ90gUYGFPYclcUdbC/XZkbNnW/4Op5voV5izajI
	Tf0f+7EidkucBFZbHM87YD6n61hJYHPf1DwTzCPPYVo8eIXZH5atog8gxJCSvovG
	jKx/fe9a7H3me6LGHCLb5qWdOjJGDiWPNEMI77+zIKs8iiicGt6q5kBcYymcM5ws
	66U611gmAJFl2zA5JP+3WuePGB0fGDc8+zGOOUWRprqp/bXTWS+tp15jxY6eEJQp
	1/gY3HmMFp1Skoc+vvkAwmBre6Fczus9DrbTQgzS2LL18C9Jcov6rRFqWUgGaWqj
	Oj6Up9qkqe1W7FLe9Efc38vdEPvvrNDcjmC6kkL8nP6TKw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu17grs51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 11:53:25 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97e9e1dd7fbso2208772241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 04:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789991604; x=1790596404; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tEMjD4QABtsqcKKWJSSUlZeCK+qOD0w5nqpSa9w3MOQ=;
        b=LMIPV2p8pdH6UKtVWl0ozImyg3Zu5Kf/SnRBlyyWCEWljfjLTzPj4YnRcDhpbWspu0
         BwoJqn2X0+bUboYTbyeHg5m8HrKGbE95P/axJo8VMJGLUErEekmXAUA/wehkMgjRO/bU
         67hVQ37Dz+CKmy8UegJz9jeIGxhejFjjHuMe5Vw9sqayY6MQuhYroDlMFP4yUsVhm82D
         XwKSRqvD5nl0+frsW6fWvUgjMAX1NVu0eGpP/ZPFW4J/DVCyOYMx/h/uJ85qTJAgqyen
         5NmUxXc0dMiKIhvXNVLXbwhCV9GC6KsAOiUyPZRbBXoE0xZAuI5xfq2uIvsg/jzz90kR
         MLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789991604; x=1790596404;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tEMjD4QABtsqcKKWJSSUlZeCK+qOD0w5nqpSa9w3MOQ=;
        b=kwL5dZUq45Lj1HUjzwWHMWXxNFxbHpYXU9gb55mnIG+NovcWDXgGEZOobnMl5r/5wr
         +L8A/FlX3ps7KU6Oo3/o8aJT0yXZ0lpWvgBY33ldcJtWYftj9YkcXz0yERSJIVAEDHFz
         37pr6muHIU+j93C2yPudpUst7wb5gUENfCTbrEw0AeUy2OB9jfueHBgQRwVPU9RXtTr+
         qmx4wxLFmEcDLaLWBwjObiJTtMPI1ek2YoTQ6N9qtcPt9++g/o20TyhPkZ/9R1lGC4K9
         migdQJ4LHymy6/dXJy8YT9clunXosSXB6Yrt1xCGhW1SbeCuWclfUPhVXvp/VfgDsVDW
         UYgg==
X-Forwarded-Encrypted: i=1; AKwUvBzYB5i3405as2Cygon0rly8xiaEuuIz4dq4cYBGNgroyyaKP19BWlIub4e5X3rcftnZD3Tc6NxVfwL0MMRKEKlE@lists.infradead.org
X-Gm-Message-State: AFuF++lFHLE6pcqNeuIYKKKx3pXlNru2Xu5NKcGoIDv2TsTE59JDs+Pv
	PkFqj2ZPnTnfy4ILu3Jf6tg1bfDqLrsTVExXs7zbn/sY2YV001NF8zGIvTWvYSRQ8sf5kQYNb4W
	Oi8E6OlcbqGE3CNFQvXM6h3Mc6xjRYy8uIwGl9p7tFO5skNjdqREDEbL+hIRgLp0A+8WIx4y7lZ
	ithw==
X-Gm-Gg: AYBFou2JTmo5rmxAidmbnrBmYPcjCUkOsOLsaV04+WZPBSIAbkxxLZ590fLqLt/bkZx
	hZO4raR4uSLOEDk7nBCP3PBQ8cUlre8JqMX5d1mgxHbvIUY2y9qNYcgJXO9hGPQw3J72vai5X6g
	HGr2Rqf79BJRZIROMvYoIFCNE18qrQB8ULXfy2/X7GXGaisUBOFAAg3WWxzIYDo1cE2weuExSHW
	aG/iBYwKh74zWwhQvXTD2mra9Kt860TmhoAz7U73rrz4RXgz525W/ksgKY5pgUBGM7ukDOyDG+P
	c+JHoTIV8ntoIoBNYc59igmR8+/+qAis6XaySIJ8mGwnhnmUUzYcdVFT1JtbDPOPjLE1TkoxKKb
	f7uvQgzTbvSNwiKc=
X-Received: by 2002:a05:6122:d8e:b0:5c9:a60b:e59f with SMTP id 71dfb90a1353d-5c9b597ec34mr5069597e0c.10.1789991604529;
        Mon, 21 Sep 2026 04:53:24 -0700 (PDT)
X-Received: by 2002:a05:6122:d8e:b0:5c9:a60b:e59f with SMTP id 71dfb90a1353d-5c9b597ec34mr5069584e0c.10.1789991603944;
        Mon, 21 Sep 2026 04:53:23 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724460753sm23129187f8f.10.2026.09.21.04.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:53:20 -0700 (PDT)
Date: Mon, 21 Sep 2026 14:53:19 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: angelogioacchino.delregno@collabora.com, gregkh@linuxfoundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
        nfraprado@collabora.com, sboyd@kernel.org
Subject: Re: [PATCH] spmi: mtk-pmif: Fix clock reference leak in
 mtk_spmi_bus_probe()
Message-ID: <wqj654zd7zqr2uyoivfypt3qioqitciwakxxhb6eslu3q3sawn@jy7nsjxmgozh>
References: <20260917155037.2161027-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917155037.2161027-1-vulab@iscas.ac.cn>
X-Proofpoint-GUID: dipLPF_ccZdpwWdCX3OmDhYVnfn3spmk
X-Authority-Analysis: v=2.4 cv=IewSymqa c=1 sm=1 tr=0 ts=6ab11ab5 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=OgdZ-FXbkxQzFk8FBkAA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3MSBTYWx0ZWRfXxsMX91WDSDPA
 YrsxpvF32pNS1AdbWHhB5JeaosJQwhujcJBhAln7fNeD3Z+VVIcNQvtC8L/GJZ85kydVH9r++eW
 0xMoBuF5nh5TLc7azBws6AcKmOkmJunhe9FGoirQmT6u+VXRuYPRzf754QCEgUP3Hlu5ga3Qgm4
 OK/ufE5S0hnS/OZoBuRZLEUDq7yhMJeC3tN+9noy9FbEyqd5SuGD9EqyUOmMuuTBOQots9Bxtla
 7XUXUzLmTOBBC3OtbBuXw0wPDYizAZK1KmgMP7ldustASh3KAgH7sXFPgcfmZr9PbSrkoAnWIlE
 Z/gQ6H07H7YOJzG99obGnQ7KXSq2gOsdMZluFowLbCUvVXdGnpTbGsZEzZSuzV73k1rZcFEUZ/U
 /RsSNvOK94toUsDQeqCWoZU4ZHIp8SCVhpzpEfizAATyyR8r3Khv63vJymiBDqyJAFLvGsSoXyJ
 8cHSObtdDYubs97yJeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3MSBTYWx0ZWRfX4gHjRScfm6Cf
 vgyb0bXfqf6ZO0Wym63FNTVKyke6shAwQvzY6gzWxDoloPECYB1aEXyJDjYrwlTOGC/XIoLrUVX
 e9fo+tNflTAr3ZBNHu3cqVFfpwahZIY=
X-Proofpoint-ORIG-GUID: dipLPF_ccZdpwWdCX3OmDhYVnfn3spmk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_125338_670635_A7CD5C47 
X-CRM114-Status: GOOD (  11.36  )
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

On 26-09-17 15:50:37, Wentao Liang wrote:
> of_clk_get_by_name() returns a reference that must be released with
> clk_put(). If the lookup of a later clock fails, the function returns
> without releasing the clocks that were already obtained. Put those
> clocks before returning.
> 
> Fixes: 078117963b2c ("spmi: mtk-pmif: Add multi-bus support for SPMI 2.0")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

