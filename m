Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB303606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Puiav2xc;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NtK1jRhQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DPqcvoA7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tEANdsClCEwLq0xOueOCh3MDRD/bgmIT1TCSuqme95o=; b=Puiav2xcGIquLY
	hULgwsflOiHmNT3Cj/sra0ijiLfN3yE+LHeoCTZjEOsFz9ab5jJveDzaGEWYs0o+FrHYzdL8odpKB
	QU7+RnObFDPU6tt3xeJyAENTpsNdpGXAOeX+b1kTQ+CnWrC2mTkVT6pVxt8Ly/WzmEykOVE1a7Jm2
	eTxF+Ov1nwV0+B/xi9wF5YB8EeLHw37rkh51XnaDzSXkP6a0cSVEzxY85gMR94qbzf0aJ4m+DxM2c
	dfpELFsEPzo9Z7H21oPcFO9ndagbrvz6iKNGrtiQmKXR0Fzwqr5X/ft01GIksAvtrEsr0mJnrr0ax
	Woijy7hMMxG8lx9b+KKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtEH-00000008Cvs-0BvG;
	Thu, 05 Nov 2026 08:53:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtEE-00000008Cuz-0hrT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:53:51 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UAQK3819639
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Nov 2026 08:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tEANdsClCEwLq0xOueOCh3MDRD/bgmIT1TCSuqme95o=; b=NtK1jRhQDPmPfLbl
	lJRI9GXWkIjGe+ZXQIAyuuMwPV+w9sqhkbyijOxMRAOEPCF8wVttPc9wAE+UJv+s
	TDqIFpQmcKYTxDWBW7lAhNyZWZEviTOPcfBrHCnmAxpUtI2xfTqCCqFDJ4KtfU9a
	FSQlNTe8IJ957w51Wzw9AgndJLObJ/VwjK4dUBlF2CYMNItf8mBnfET2vi5IlcUn
	kQRWYMEJWtUxGDAio0XYqccg8SBZFBo7a4/2XMYePw8/C4JGkkQ2CJmH+YtrOS8X
	mle8yLeEz6aZnzaC7/fJmzgkaCtXvJlIo/uam7OlocQFtuyz/QJ/ae1h93ShDaTW
	7ZTYNQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hra5tk20v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 08:53:48 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf71bbf197so1278304137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 00:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793868828; x=1794473628; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tEANdsClCEwLq0xOueOCh3MDRD/bgmIT1TCSuqme95o=;
        b=DPqcvoA7KsmqNYcyfrHML5N+P9KxxtZuvJg+RV4j7sOtvhmrE5j3YDn9zhv77d9yIN
         8l/4C8khiIF2nOh9nKWCRoVedbl8xCcuRhCLF1xDHZUz64+P85gyLnqJg4EKtE+SbTLq
         UVzUt/Vqt5pyy56RQROqJgksTmKQ4+tGdCxyF+aPAfAzPWaW9Fla2CK3js+DQLLoZJx/
         Fqq/E4X9wISNOOljpoCybLIB7ZW8gAtRd1gX+TuTnBavlwCFX2E6/beX3wYb+ecukEyu
         /3i2yR/LHEPL++07fEi9AtSBVwu1lR3zGk5dPyIEqYdTVVnSgQ41gl03Pd44lUPrzlPk
         O5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868828; x=1794473628;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tEANdsClCEwLq0xOueOCh3MDRD/bgmIT1TCSuqme95o=;
        b=PQAOIb0PPUPMtr4CEJjcKw4xWe5BWqM4mPu85/ISrGnIliM9Y+qvdYZo0zZS6HAUEl
         08bQ3mUseY0CMILbXuT6Lke13Gn00KDMtKQAyc/Raauww1GKNmr5EgUm4jhX+2GG5lJE
         pGyl6FAomSbl8/3qdO9RyXGvObetBPQS3U6BSKkYxHbHz+oWLuN28RwYSVy8Q4jXAiXE
         jC/ezH67ckQ4Zf6BKYTUEceHKVygRR5YjG6OlwtlP1zQAvaM7mNyw3galVJ24qhTq/Ip
         zuSwOXBThjdR+YDc5TpS2vyPOdET3wSGkqO5YLHNSmqrzmPLpCjQ17v9r4XVtzfo6yFt
         Nj9Q==
X-Forwarded-Encrypted: i=1; AKwUvByE/q7unHpyDSymYTVU39xdNUBDIwCU+bxo3VAmgp9nzNx4hs1zIFPmHs6+5nr28nWHbNYlVSnrfzsveF6E8f11@lists.infradead.org
X-Gm-Message-State: APuU4Z8sLSPztOBaDHMJrpe16T2kPWifLjTENJABLtgAZTmnl9PS67p8
	9kMJ5Y6UZMZdr8O/IemHA/bGK5aUNgKC8vOb+PchQ2eo6YbO10rJGYA1a5kEzo2jG+byfL6q2iG
	wmgZbe09ChrIE1khTWEvn7mxyYY1wcTiiWuVF781ByUGTQxE7Xmateb4hhvLWGTwA+euGvcRGYl
	Xp2Q==
X-Gm-Gg: AYBFou1EakpnZd6ozeEin7CqKwJmh1SOSO3/OgUDToG++LqwsOvWjg9ebftSqRmv/Vo
	3XCKF+QVIUhz3mpN/i7zBe16SmOS6llG8JM1JBvXF7SsD9mrsiNn3sm6oJS6AFohO55rjUIF39g
	Z+mO+ZQzewztz99JKMkqas0Hb5DUjvDvaNjmiCyui+urxdD9Xw+wCsd4BNsEIaGvKL+Y96ulDId
	xLOt4VbT9mQLajWIbVwRvCuA6ttl8iAscZPyvHNe7e1GRCYMIT9NLRKfWdlhxo8VZPQ5G2oKFnu
	Q+ZKe3cgWhFHaZU38EU8bdiNMtY+8LJwNDXc0/w5jwb0bKfGIkODOAcb5YTJJ4M58tvXSKF85sj
	K/2Lr4AacViSmWYShpVkdrd6B/An87l2yfgPanoEfZx3BFkxdBmc8962dlYxkdZ4icOYkFd0vn7
	lE
X-Received: by 2002:a05:6102:80a4:b0:7d2:7827:c03 with SMTP id ada2fe7eead31-7d278270d6fmr2667816137.25.1793868827864;
        Thu, 05 Nov 2026 00:53:47 -0800 (PST)
X-Received: by 2002:a05:6102:80a4:b0:7d2:7827:c03 with SMTP id ada2fe7eead31-7d278270d6fmr2667808137.25.1793868827489;
        Thu, 05 Nov 2026 00:53:47 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecf8e341sm8972866f8f.25.2026.11.05.00.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:53:46 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Adrian Ng <adrianhoyin.ng@altera.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] gpio: Convert to subsys_platform_driver()
Date: Thu,  5 Nov 2026 09:53:44 +0100
Message-ID: <179386882212.12982.11268787304162434768.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104113309.1634121-1-peng.fan@oss.nxp.com>
References: <20261104113309.1634121-1-peng.fan@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX0FEJPktPwQe7
 FKYOFBJ3lM//uZYRJxFmGoU2569s5kv+9XmKhHEd2VAhqT82i0Txgqn3T/vR7Up2XZXdTxg91Zy
 yhPpX7U7NyV9ufhs8Syb2OLwA4BfDpQ=
X-Proofpoint-ORIG-GUID: 43xnrjQgu5Rqrot_IWLdL2ZiJwyvmegd
X-Authority-Analysis: v=2.4 cv=P/6vFSAu c=1 sm=1 tr=0 ts=6aec441c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=DqZYlRkov0yPPlpfqKoA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: 43xnrjQgu5Rqrot_IWLdL2ZiJwyvmegd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX9DIxpiXMEE48
 1uJH1ptg/kQm7jsfMBfNXQ7TfmRqdrcLWFOmrgQJeo/p6iKjPC+6yV9ifGSqVHP2ViPZVtGziWQ
 S9JtRhMsSSmxlz7UqAMKIRTicVHAMklvkdjX4xrPXDbd4Ofb9heX/cn6RN55MuglL/UDrIrt+YA
 b1sNza5XwhhtyXOn9k5OKxIzdXhyYAJs6G+2uC3SJPqfjNqVaYAfWg8VM94fRGLomwZROiEuJKB
 PzEiF4vnFnqE6mBes6mRpVEVBpN3NJD9wLlOgJQYAJvq277gQsMX5hq+ulxHipTrCWDIl4+y6yE
 PUvAAiT2EM2HP25Y0ax0B1bRklCihnBsXf0VLsj9Q0xk1p9QwtYjXNCO+f9Jd8ZO0r04Aw3HnRd
 l00Jxm0ZJZOIMzFS6cjpyJ6+OiPqdO9OuY4pudytWk07Jy/UvW/t0XZeZB50aQQFTopiExuCBKM
 hBSzZgUcNOOA/8kEZ0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_005350_319697_FF6F9B4C 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 04 Nov 2026 19:33:09 +0800, Peng Fan (OSS) wrote:
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
> 
> No functional change.
> 
> 

Applied, thanks!

[1/1] gpio: Convert to subsys_platform_driver()
      https://git.kernel.org/brgl/c/123be56be13ca95f5bd5f143bc2d6edf0fe71221

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

