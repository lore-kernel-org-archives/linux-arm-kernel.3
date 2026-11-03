Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08C9606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 00:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s6Jpd5E2;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BVB/PWvl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V99GVfoC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KVUV1+mwK52vEYaTF69wDnDvl4/N5dnXbFTWcMNoPzY=; b=s6Jpd5E23wi7ZJ
	5nQVmTZqsDaHGU7TcC5snt82Hx+a33eldfU3HEcuSmTB1qFC746VlaoWx31T0Eczz74k/HbJ9z+aL
	ViH+/Ps5mEwWxyp1yMwt9mWmbVUwimUU+3SmZ7e5yDn7S0ov2tzPWVSmaUTX/6Y6WT6D1t6uMMheO
	zqwIiq/mWS2PQzYmkrMIfn2iJImFZaWcXXBXBTJnTJ0rAXQNPmbD2CfNSZyKESK1KBLoZCa/9z6ZA
	UsxTbhyY27dzFiGeuWGtfgJYFTdxbeOEeFnQQKjRvmxC+YcxiUJRIzCw3sL55TDchYXUdn3CThfna
	ZHd8mHOsFhPjDz5m7mXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO2MC-00000000jlk-3Yw1;
	Tue, 03 Nov 2026 00:26:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO2M8-00000000jlO-2QZf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 00:26:29 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K6Cn23292678
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Nov 2026 00:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KVUV1+mwK52vEYaTF69wDnDvl4/N5dnXbFTWcMNoPzY=; b=BVB/PWvlG/fhji5T
	hTvL6LCPWNEYZsd9WtKha4mpxtj94caZ4gP/S2Qtl6Q0Zl9G3c21pmsOQYM550x7
	kjWciHXExx/IhVbEolWq6y27AoDR7tVYIxt+jqjlNJgLzum4e0PTiCSszZR2b8d+
	vbgvDnrY/qbcwuuTXMSrHGTF+M7kridZ+X82vEg5Oi7brLtoqwxyMPjdo9H2NORe
	nlHH5xPyUXAv5NpXYNRIAnfXmevDAZNo9fRDna3EF0azswSUH+srBTsLkZx7CBvi
	sFk7bGlN0XMSjFfEL6FnhE/LEVVFXpSvHnks0b9E0FxTfIzHckGdf55mIfv39h6S
	CriEZQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07eh4t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 00:26:27 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso6748731eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 16:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793665587; x=1794270387; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KVUV1+mwK52vEYaTF69wDnDvl4/N5dnXbFTWcMNoPzY=;
        b=V99GVfoCUIGuvNFEwCXN6HGu0m4J6Ex3r5qrLeoZN6MenqItHcEW/IQGB9SkawEzFc
         hqRbamDNCx5suYXFueuuULTRLM+ZJmiO7m68UQt8BFK5pCck7jwb7GKG0JCdjKBoyKmt
         RjmyPPPZ3kVDvz7xIGGJaRCWwNwgHf19vuf2MSpUahuQ4txoYu+QttMohNm2Dhn06YsB
         sSm4I3kwbr0V6irQBq4cGNY8sm+OeUG1s+BliLuXxmQ8ueNJtfdEnBXoDbG9isuFCjpE
         G6LVqbpwO58Qo8vk0tH7z2lMiICwtg4AqMLWsZOBTVBR8XqaX3aU4XN/g30rTgdUfKB+
         KHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793665587; x=1794270387;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVUV1+mwK52vEYaTF69wDnDvl4/N5dnXbFTWcMNoPzY=;
        b=cpjmi3TqUsSBVNVVgWtIHWOEQ+fx0p39dHJJg2ioHg0Vej4cbyVVx6lgsTkzXyIGb5
         K3umzr4Cj2CA4VvmMWiduT4oTPGtYep101q3KIS4qnMPnLQidkFZQJ0EVjUGQQOBihol
         +xJNURs2crTWSHJHs25JQwCIljKGyj6CWZuAsA5SwxYIWpIgPOSRp0bRffKf0tqYM+lq
         /T7kT2+8UJLprzgRwW0/gFXtr8bAozl6VVgg/xOLg+WYoAEHvQjNOabaIID6NCElVQIJ
         cpqZ0qSs47OZxeZ8sqNlpW20tXkQHRzG10F+joiTs1nqw6VdGggg+ocLy6bKgD3u2a6c
         8yuw==
X-Forwarded-Encrypted: i=1; AKwUvBwi189RV9ortBmTgnbBWctPyqjTuwls6ep0B4TPKO4+016xkfWmjZp0wQ0YAcodtVzj6Hkq8YB4xWPH5ZP5YWTq@lists.infradead.org
X-Gm-Message-State: APuU4Z8dMPU5gnv7TmowElkhgWOj+qocA/P/KLlBPOuGabUsyqNHWoZT
	w+bHCtDXQqNJbgc2vW2NhaddftC7XyUS5ysjBnCl5DyE3scxRMtr/Q0ON9GkpGdTPgAA4bAMmjL
	qJJhhcFBrVHQscEEKxswuAV9eDUyePQGtFUk87zFmzoeTdUSOb1SlkTZlV1Sn4CF1GT2cIhNhlV
	c7Nw==
X-Gm-Gg: AYBFou0m4F6o3xjkkgyLAUf4cUwsHW5dp2uZLv0vNxVDwU1nHHXr57ufQSW8M7995AA
	2DzZ6T3kNp1IiFiacx5KyOeq8uFMYkI/Rv00Z15W5NEWweunc4Wzusdhs8QZCoGO6by1bQCms6s
	XCUJXSJarHryD6LxCtNZNt5rA/yjGmrqQVEDjS5mgH790sTic8Lx17JFmuGLvrMbrCSYH6Hphu9
	9XsNCw6tAPbSsJvjRGCaAcSVw3zP/wnjG/1bbKpuaMVMBDYZI1DdOQoPzXu3v3GfEceFkDdqsup
	AX4K8/yIpOBAfR7e2qRO0nNNkJJ6cRITe7riqjkFfDdJCSPiHkzDoEzbRgU12V4YiT7sf77posX
	WSr/iLFDg8DD7fNwZnbCby3LGsvE+FMlQOZL95i6RYqIWi9oqJkJ7QTDYK64Coc1tMBdfraHXWv
	+BMTOErgI3kNw=
X-Received: by 2002:a05:7301:6183:20b0:36a:1089:9836 with SMTP id 5a478bee46e88-36a423c8988mr16360463eec.15.1793665587230;
        Mon, 02 Nov 2026 16:26:27 -0800 (PST)
X-Received: by 2002:a05:7301:6183:20b0:36a:1089:9836 with SMTP id 5a478bee46e88-36a423c8988mr16360432eec.15.1793665586499;
        Mon, 02 Nov 2026 16:26:26 -0800 (PST)
Received: from [192.168.1.148] ([68.248.129.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm39285518eec.19.2026.11.02.16.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 16:26:26 -0800 (PST)
Message-ID: <374c9df9-eb58-48eb-8447-b6340df37719@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:26:25 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4] net: stmmac: dwxgmac2: enable L2 split header
 support
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        lorenzo.bianconi@oss.qualcomm.com, hongmei.xu@oss.qualcomm.com,
        abhishek.chauhan@oss.qualcomm.com, sarosh.hasan@oss.qualcomm.com
References: <20261015221215.1714047-1-sagar.cheluvegowda@oss.qualcomm.com>
 <179244898962.3135.12890405028818098249@kernel.org>
 <32fc0379-0c45-4011-a7ce-795c44594b89@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <32fc0379-0c45-4011-a7ce-795c44594b89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAwMSBTYWx0ZWRfXzv+KKG8FRbU8
 lhT+IYYerOeBdbH7eMNHUKRR1/IziLn1NAGc/RVxCcO/kk2n4L8okaecE57c8ae7blFPMzw43Bz
 DUpyqAC5onuHMHA/IV8MH64whP0Wo/vqeZfCez390cKCPPQzWS+IyQiTjTegGRksCkwMX8GPE0K
 k65zLhp5wrIR4DT3K5a/mcv/a9ISH/7jJjh+7P5SOquWsupe0Suy3mWl7M8tO1K4tAB4QVpCBb7
 jw4Bl1QuoBDPfm8dTwEzIT4K/MNRXsaxNeozd9IhvPEQzQONFZ+aiOnhd01RF7MW8Va6gRz5nK/
 efScmWeJwr2j3HmMcQ0p5v45NiRmzWvUWr6XzZ2lrxduQ6W5vH4uPmV1XpeeAXEiiIlRs+5rP53
 7pz8j7iD6cP/ti/L9/nTSVia2LvdYup5I4z+c5NvyNJ7khk0jRiihThjh08e7wSO4Foc6lQzRZC
 AErUFpEdYnyPQlNL28Q==
X-Proofpoint-ORIG-GUID: 0PBYV8nCcOFS_hPbaDIwltH8b9qSS_-9
X-Proofpoint-GUID: 0PBYV8nCcOFS_hPbaDIwltH8b9qSS_-9
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae92a33 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=djYDpCgIitZxdph7ACYjJA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=ZIJvd-A7hXLYn3_D4tAA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAwMSBTYWx0ZWRfXzlD4i5GKASKk
 hoZteCDEgwXC7cNtic/IQhtjoHDu/9zy3r8RK4cd4gq1K2I6tdvG/pKZFydAZJxMuvE6XX/xjM4
 MjRxQ47CIyUA9gs3xbFH5TLPQ0UTMsE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_162628_648675_596D8D90 
X-CRM114-Status: GOOD (  11.80  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Agreed. I will send the FD/LD handling in dwxgmac2_get_rx_header_len()
> as a separate patch to net with:
>
> Fixes: 96147375d49f ("net: stmmac: xgmac: Only get SPH header len if available")
>
> and rebase the L2 split header support on top of it for net-next.

Correction on this point: there is no user-visible bug in the current
code, so I won't be sending a net fix. On XGMAC the RX buffers are
sized so that a frame always fits in a single descriptor, so the
FD=1/LD=0 case where L34T is not valid is not hit today.
I will keep the FD/LD handling in v5 to follow the databook's "Header
Length Availability in RDES2" table, without describing it as a fix.


Regards,
Sagar


