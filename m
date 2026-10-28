Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817F5606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 09:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4Lg8aCa9;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ldPlcGE0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Czm2+hEW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=O7UFyGc7kgg/xP65U47Z0ECqHDvtGybh3bypLow4PPw=; b=4Lg8aCa9Va36iG
	D8IwocXNUoWr0qjqjShC/2ytHCUW4gwMqDFnF5Be/oEoU552BXDcRd0AEunPVU1CkIRAd3x4PZ2wz
	LU0SSutmGIUPsehe/HLohgR56KtyU14MQ4mZNQSDUOA6B3jOocIc6nzTXtpL8Lke8HzRmrlU2ygWm
	WZq2RERQGgHvep7GwpJDUkORC5JWip3SypGk48IsCavRxV2aEKJouda8ztklWnv3EcHt/B4Nrybnp
	lgxYQIcjrjNjWfZNqA7UT+Zf83yFb/zksvkZVzgXw4epW/T21RkkoX+LVKETsMfbiOdLg0GngQPWy
	r5q2sixhP3Gu2/0B6r2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM04P-00000006fvY-0Fkv;
	Wed, 28 Oct 2026 09:35:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM04M-00000006fv1-014K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 09:35:43 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KAq6557407
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 09:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O7UFyGc7kgg/xP65U47Z0ECqHDvtGybh3bypLow4PPw=; b=ldPlcGE0hlHPeHPP
	QJsuYuWJOSr1QAAkv9stM42AGaYcrar0p3Wj8m8+Vj+MunnwUcro37aZ/XgXQcq7
	lGk8u0R3ntPAuRuPr1asbLLMGf8OFvizMn7uilvZWWGHR0BEK82XQODY14/tM+km
	bSuX2pTt3ki9I6ubtu06bghbBUxPQr26tgVt0bzXHlbCd2hCFxikGiMw91ZWMns7
	7DJGZB0CW8tmbvqjvFfm3GM8VWkJha07wu30iEqSx1F0K5+HUnfMGXy3oJqhOaeJ
	e9t6ZaC+9HjalTiNd9xTOGsUa61WxjZ9rmCRxz5Lu/GgvDT4Ea5SE6GA265As6FA
	L0XZNQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82tsdvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 09:35:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so139578385a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 02:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793180140; x=1793784940; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O7UFyGc7kgg/xP65U47Z0ECqHDvtGybh3bypLow4PPw=;
        b=Czm2+hEWfHYzr/btxdCZYrlEvB5mLWp8X4fTx4ph+ptRQMc+4LLKAo4vhzBrBcgpc1
         swdCNciop9RKKxLUXmi4AniCofRadoM3kZVlpRUVnHzIHCPObLcfZckTVHcGbReCUWSH
         VBsgCTomiUKn1nvJGLhS0JXix5I6so6rFcmTPyv1Er+yfaaTfVSDs+D7Ze5LRmn5XR7e
         3RZ4gPvlVFrORrqm2JRv74QMjG7TLLt+M4OhB4XusRPm4tK4cakdpzfxZMNbYKkOlw6N
         gq6vO/TgoVa71v1SaTwooMOOu8LvODp8D0PjvprlvitWTWK+2g3q454RmHCW9lhZeGce
         yOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180140; x=1793784940;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O7UFyGc7kgg/xP65U47Z0ECqHDvtGybh3bypLow4PPw=;
        b=qSNhx+GBrQ7C/sNiDUNU+XixURQPkC0BVrtvbF0edu6dNpkd625IjEn7OW1ELtPDGd
         I55yd1wGRNtBjMjWkoD7cdLY8PkBopv6K9PhHHVto3LrnLdnnMjnlKWKPYnmkOSHFEye
         ER3y/FT5jeo4l4sTmKg5p9YR5W3bQIz/z6Bx+qKq58XkzHIB9j2hxoS8Mgqnm7O6mkMg
         2Ld0QMIbB8VG/P5Izm8PypC4E8hCJ6G2QLje/BvqAlHYx0ZsRuPNm0aH+0KbYtqdGYyZ
         ftr+af6atpxVA0WSZPZPAjPm72mWqv4Q7rb+SXSjUqCW3V6zQeFat2y41RdaUuW4cIPx
         vT+g==
X-Forwarded-Encrypted: i=1; AKwUvBwIqT7qgFS31IEN83KykUkvs+SMjsr8ZO53utvyrOhnDB7m/hYVqIzeoASH8d9WpHTS2om7EgGWzR0eMmVkdNT6@lists.infradead.org
X-Gm-Message-State: AFq9FYLPN50WBDA24Yw+7aHaycqReWQPoWmHQNTusukAxZy02iwCmXWV
	PsYC1hLEFp+Vjnf6YZ/7A9//RCSdf1OEv3Y38/ez4zwxdXWJCGo8fJHve/wMsJdodrgl4CmloxC
	SQB8ci4LWJtz5dQq15WfzOd88yQZfuGuDFyE4be42bkyfDlERnl3fvSUJuHm5rmsUPZfdaOBiDI
	DpUQ==
X-Gm-Gg: AYBFou3QcAMzg94PqSUBy+rhV0BX6R/6NzxhYI+z1ASYnfgO+SHHgdQp3afDb+nXXk/
	kI2oBMZzxBHheprQv77xasKtVMY70g/GrDbQE8EC5b9NFQmAYF+nVCY9JCxuzfAjqkbJcupEtcm
	8pCQrJ0dGMXaVTkvnCx7gC1P78YTDdRwJX8dj15cYMZEcZkX6kJy2wGs5OE17xoOB7j9oHBMr27
	aSOhPc1H28EnyKrRo3UeJApdY6YsfBo85jepxjIQSiFjfVb72N2kHo6nuQ3GEh7xWD0eFNkqmEx
	m4QcjcFBm4Gy4zKv36D32wBkYErHWEKHnl/4Oet7FxmUUA4ecGc7KKs397pnhLF7vhLc/j4sph8
	ZQm/VGaPTZcEs0ZKkXUODibPxpvPw8AbVdtaK7dgvY7QMEediin7xQ36M3ze/dxEihoyUpnGccA
	t+
X-Received: by 2002:a05:620a:838d:b0:93e:f4f4:346 with SMTP id af79cd13be357-94408a96a06mr192968185a.39.1793180140004;
        Wed, 28 Oct 2026 02:35:40 -0700 (PDT)
X-Received: by 2002:a05:620a:838d:b0:93e:f4f4:346 with SMTP id af79cd13be357-94408a96a06mr192964485a.39.1793180139398;
        Wed, 28 Oct 2026 02:35:39 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece13aasm25490073f8f.58.2026.10.28.02.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:35:38 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Gregory Fong <gregory.0xf0@gmail.com>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Guangshuo Li <lgs201920130244@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: Re: [PATCH] gpio: brcmstb: fix UAF after IRQ domain setup failure
Date: Wed, 28 Oct 2026 10:35:36 +0100
Message-ID: <179318013455.11588.11130360473129768323.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026115227.41779-1-lgs201920130244@gmail.com>
References: <20261026115227.41779-1-lgs201920130244@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XDHWOGBHazW8P54m5nxUAK0cRgasT-gY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX7ftu4cscn2gy
 e3Whp0ApUjGDnvemdb2lLm5qo7GVJFpy1mVWVkoALjvFXS3wwL/PnNNr3d0a7VIGUsQCBCx1Qbm
 TOupnHBkrlsMFA3gE4TvTKN2aFzEnnQ=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae1c1ec cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IDcPP8y_D6MSDcTJfBEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: XDHWOGBHazW8P54m5nxUAK0cRgasT-gY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX+iAmQx9TLUmr
 9TC+4zAQ+135ERCrAws/MalP2LpR/Etvnh+E7I7t7wbEgfTXUgWQvdQrJvT/h/urB29XRMTyzuZ
 l7Kn2NrItBj1mOv3G1V5BYdac5K0vQ8MdVhYWpPwQmb2s6H6MnPZ5ml0oToXmmpoRAqNupQ7qzY
 l89Sgo37PVHutj0/guzd7CCPHVnMwZIhPALcZeFWvxZTfjwpSlENc6aNEuXNz24PMXNiAnwCzPJ
 V9cITrUtqDOS5lsPw2VrPEGRfAblUKVl9q+Q8UIRDylq0SOBi3H9da0ZcbBRUc6gI8cIZ9JfCpe
 fUU4Z4QKIi2bFBapkwU0lsx2typSbWhWemR9AD0ICdZmD9oRcQ42pYSAMhhGOrc//sfvPEMsehG
 TthB0XplcYOkFdHfuofwZegKfnZlpt5ygUGtg623RdDvEkhLtZ6gqiXHESQ9HNKFV5sSt/1L/wi
 eSgn0RDRQUpGl6QiCHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_023542_159775_22E5CD7F 
X-CRM114-Status: GOOD (  12.18  )
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


On Mon, 26 Oct 2026 19:52:26 +0800, Guangshuo Li wrote:
> When devm_request_irq() fails in brcmstb_gpio_irq_setup(), the error
> path removes the IRQ domain but leaves priv->irq_domain non-NULL.
> 
> The probe error path subsequently calls brcmstb_gpio_remove(), which
> checks priv->irq_domain and attempts to access the already-freed
> domain through irq_find_mapping(). It also attempts to remove the
> domain again, resulting in a use-after-free and potentially further
> memory corruption.
> 
> [...]

Applied, thanks!

[1/1] gpio: brcmstb: fix UAF after IRQ domain setup failure
      https://git.kernel.org/brgl/c/baa14758afb3e2828de1f76511edc1de50216f39

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

