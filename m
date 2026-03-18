Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD4E10775E1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 16:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qko/YRXofL0g7xK31fRPrNzfjiKro7Z+in3JRlMOoE0=; b=fuwGIiaqPO8voKCvVET3k0s+tD
	EhwFKFOH5W1YTTCYTr5DJzJd24qRzP1SjG0v7UgkB8B/TerO3ZGLbQxRjmGwHLGIxroOevpLx2URc
	cXIDZ2l1uZAQ94fRPEh+mkCN5jl1h6sOoFy4QhFC/JLQBNxSFzZIE9jkIS1lv9uBlY4ANRjWwGZg2
	IGd9Wq9pFx5UDNah93h7Cvm7iea5AUSTpjQXgUIF4es/KbVRrnXmy+/SeaW9nArr8b5yWUU/ZYSe+
	0R8jTryZbungZC8IQU3oXnL6NYv8KdunTRiFjeAU4f4fuX0hCz7dSpXOISO3xICU3Dqj1czO7lU1K
	NkUlMSmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ttd-00000008xhB-2EQ6;
	Wed, 18 Mar 2026 16:37:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ttc-00000008xh4-0pjC
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 16:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qko/YRXofL0g7xK31fRPrNzfjiKro7Z+in3JRlMOoE0=; b=Yk0nNRM+QxZrav0rdpAXlPQiGp
	SGIV8rCj+Mp8G6Udbgr6GFhkgDHqjDaEOsK6RmEtVYS6ToHU0Q8+m/OEEiK4lL5cmCNJrFAZDbsuL
	dXASTOQlVAu/iIy5dinjN2/u2XFeaQT2L9DQunPUkfl0qCCPZ+2qDaxasKpU5EYrRafJcR7Xj0G/q
	h3AN7vhyYkFUVz6w/4QF6mzWJsresVXI7fCoGKcUHQjgXaQTQHJQC7oF7CpYx4umu8WIF/Qunzp0u
	QwNeSSKCC8+ExI2uPfspRjBg3ocyjWrMj0CWxSOYIPRH+N5MaOqYEGTj04VXboX/kLqeRh6IFptPJ
	63TegK3Q==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ttY-0000000Bju1-2sAT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 16:37:22 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IGNioI004987
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 16:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qko/YRXofL0g7xK31fRPrNzf
	jiKro7Z+in3JRlMOoE0=; b=S+jKua1ES82ossdgH1hPCw4HPR239ijv3WGXmk0p
	iN18XhT4T+64frVMobCY/kpiwPx9t7/a+5D7FynGCL33iokELy26eHx8U36fh7q+
	F6QKQYijdPZIcAyOAmqiGeZnwIOW96RO/YRVB4No6kPsg7c/RdxD/k9qOHaTQEku
	Ud0m+Uhfk5g/i8P8c4oDWXWXbWAP74ORPa13QkJRG2jhw0Qsc3ttNT40MwYzSngT
	4PLDmY+7RCPOm0e212i3Qv9D90S2hNah3VQg7TuhYOtw7UO1+8nRGDhCeJH3iOR7
	DxcSf1eNEa+fqwW7KVoTwwR6Ly/fUDVbza21Y1fnby4JNg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyyhg81hq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 16:37:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509159f57e0so159817461cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 09:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773851835; x=1774456635; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qko/YRXofL0g7xK31fRPrNzfjiKro7Z+in3JRlMOoE0=;
        b=bkBp9J5bJ7djDHIjAl4bMWZhCGJ9pLCPT7NGruCwZ+24mmauTRpoJFeefqtvJa54HJ
         84NNtGo5+Lwfnm5bC2d7l8c1bcNZao6oPDp3VhXg8gHDiuvNODiiELdpTiK62MQEX62r
         c0K3mmpoLKwIdYw7eMkz7dELkOqWvVzFW9SyWjikhJZva9iRk4Eq70/6MAJZus6tJ8SG
         J4PNb/AE1sFg85Mv/ql6cibtD44tfwIpXixpJu9CkOkMQ6IjFJ0GJFUD9OLbgUY8pCNx
         KAdLlZuwni2E3s4Z6qCk0Izd1F5RAW7mJVkJFCEkyf6m8QWk2UTUl0ccgu7zNiLFYahG
         WvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773851835; x=1774456635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qko/YRXofL0g7xK31fRPrNzfjiKro7Z+in3JRlMOoE0=;
        b=fbwahoNxITymlOIepN2Q0shsXYk6TyDiLmmoGAUXtr44onOJ7/JxaxMiU0cnSx8PFW
         O/2iELIqoNSybwjVSO8uXbUJm+QJUiqdkA10wqDlmTpZwHS1N37JF71c0u34SO55q/oa
         bOcdJ4rKXZxWEbHP2e99c59JMHhM9NhuD9tPR/Qo2lFwTW6Cc29bTR4FRcpT0KNDprjJ
         vFXtIRZ3JbAKQx/3fgjhn22kgmn1z+sXUk1X+zAJSF51y4432GtFXNhG75ryZIM8ISGm
         eACtF7o5dU6a/3PfLLgTeXYnplDnXKnzbiXxGr5bpbnW7mC4mmCywYOXWhQjPcpe1Tuz
         68sw==
X-Forwarded-Encrypted: i=1; AJvYcCWYvzQPaNQD6krp01OaEw8qS5GNigs2gyXHQkU35ltyU/TXPJN28Vo4uaATkWBx8Pa8ncTX8/fqxiu3u/OAon6+@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6XGEbcPu1e0MqtmgMom2hfwECD9uaibBLlcw2XCudPiIwbYJC
	B5w7CPfKbTT1H48VY1SQaiDvyJMLAtUevbgGmaUwgEBcgtzU/sfwrIkPLELDi9wzj/LdlGqmWzT
	JPoMDDvQ1AkTgnNxMB9WrP98XXFs7A14PHy1lMEWbSSndZigGtkMT1Agy9+zEaCKEnoItr6TtAD
	BRow==
X-Gm-Gg: ATEYQzwnaxcgS2a8sEIOf77I6xWR7Znr80U8ItS/dwt7cohTir67f6y1P3FobGai5Cz
	DjnHu0w8vZXTVzkyUt2xGb5EhuZATTMHQkq6W+MhxhjiMOi9FBIutp1YWAa9kPImvD2YVANq38y
	eZ98RNR2oRvBbPyiApOpZav/AZnTlzVpEcIfhARja1RR/1D2PUul3EtDoLpf8/L2XTj2wouB3wA
	aUyBcZmsOB1vgQQqATXi8AiUhnkwY3eHF7Xams+C0AccQRgRB98FVwQ0HaQCNwxa7ARwW5WsrHm
	VzZHzEYtRuw/ahsQ7GrkJ4EjQyX3rhaLU2X9PvdgTldeyor04kyS3SNNL0er63EfoRQqAeF3jyi
	I3OhE9zo1W9BYSNyTJUgz2nTLLLvxkbt5SQ==
X-Received: by 2002:a05:622a:295:b0:509:2655:a95e with SMTP id d75a77b69052e-50b148b14e6mr50661741cf.62.1773851834675;
        Wed, 18 Mar 2026 09:37:14 -0700 (PDT)
X-Received: by 2002:a05:622a:295:b0:509:2655:a95e with SMTP id d75a77b69052e-50b148b14e6mr50661201cf.62.1773851834101;
        Wed, 18 Mar 2026 09:37:14 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8c53153sm2136765e9.13.2026.03.18.09.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 09:37:12 -0700 (PDT)
Date: Wed, 18 Mar 2026 18:37:11 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, daniel.baluta@oss.nxp.com,
        mturquette@baylibre.com, sboyd@kernel.org, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v2] clk: scu/imx8qxp: do not register driver in probe()
Message-ID: <sfo2ib7segaqnpzd3u22k42od5cp4mrz72h3nwp2ihrds7l7uk@6xvkvonk2sg4>
References: <20260212235842.85934-1-dakr@kernel.org>
 <177384710701.3709943.608237959975537642.b4-ty@oss.qualcomm.com>
 <DH60U76GPPWN.1UJJ89FKSXOWL@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DH60U76GPPWN.1UJJ89FKSXOWL@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDE0MiBTYWx0ZWRfXxyeoA0O3T44W
 DDMciIHze2iI8mG4WRJYeBFQKGOKawa9E08r4TVs1i6ccOjb1jBw3hCQx37TwB9ogEVsNEV5Oad
 mxJP+ZzmjFfnie3U9fO6inS6/r+H8rTd1I34+i3uUY6+b5xSjWPhnvKp1oxYo8MvR4guSmWkqxu
 i0Urh4FYaRAj35qzAC+o8bWSMbsH28mSTp9ykuUHOFdag+dcTBV4UK/PgMznqk7IJr3IKUf2n9F
 AqV27/ZnOGt0DA4PLz+9t54YO72va3Mx0Z5CTp5kSAE+nDKqbZz4cTA8vbutY4ySG+HITVN5wZn
 xi4mFUVjDtU/e7FXdFz0qxwMz0aDlJ2YzMiqMHJuAJ51ooozNzCg6jYwTfmo8bCyLdfHrsSIb5R
 Ln4836WspIk4UMEOSNjlZNAGoM9XzZhMy9KQFIO5KrTHJ3aMGj/qyKe0spV/S/MMCOxbCnoeH6r
 LdmfEqzWKmX+rNeyMgQ==
X-Proofpoint-ORIG-GUID: WtP4pg5MVCn6fgyxnz0Ug-5NWerOW1S-
X-Authority-Analysis: v=2.4 cv=IbSKmGqa c=1 sm=1 tr=0 ts=69bad4bb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=CELFId4UG5F86OlxqCwA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: WtP4pg5MVCn6fgyxnz0Ug-5NWerOW1S-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_163721_088622_B1FDA908 
X-CRM114-Status: GOOD (  16.85  )
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

On 26-03-18 16:42:49, Danilo Krummrich wrote:
> On Wed Mar 18, 2026 at 4:39 PM CET, Abel Vesa wrote:
> >
> > On Fri, 13 Feb 2026 00:58:11 +0100, Danilo Krummrich wrote:
> >> imx_clk_scu_init() registers the imx_clk_scu_driver while commonly being
> >> called from IMX driver's probe() callbacks.
> >> 
> >> However, it neither makes sense to register drivers from probe()
> >> callbacks of other drivers, nor does the driver core allow registering
> >> drivers with a device lock already being held.
> >> 
> >> [...]
> >
> > Applied, thanks!
> >
> > [1/1] clk: scu/imx8qxp: do not register driver in probe()
> >       commit: 93a6d39e78bfa78b2160621aafbb490e063f12d9
> 
> This is already in Linus' tree, you gave your ACK in [1] for me to take it
> through the driver-core tree.

Will drop from my tree then. Sorry about that.

Thanks for pointing this out.

