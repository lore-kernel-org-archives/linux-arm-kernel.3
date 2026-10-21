Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B335C606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 07:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lzknVba+;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AyQbDhhI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fMWFXAji
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGEbX7ewHLXjKOrnEAwIQ5NuoQ6GYnuPMjFfMhRkmzY=; b=lzknVba+bOUPyZzi0wyr59rpeh
	iG8d1imJndSywhBed6IaW9BYXctRjMd1AR1RXMU/QyfLVMUftLXKyPehKgb8snzouZrhw5S14Thr9
	irktrp8eB8bpWsLLvh2vJhVzNVKVJ118QI+xnjPZZo3RJDIXu8hXQCZW/tuXFzmG2Ug/1hUQg1NZd
	eTHyZCQpHiiIStHXht/q3NjFxdyLctTPeUC/aIyER9PlbhCkHBPB3Aad8XKJZi25PrrqAbW949P/B
	V7PJtCfR0mp2q4PfW0IUdqhnwO65ZfiYF5JGlrykEPejoVEr3ZgqUWX3/ovq4BuZbSJsGIzsYAVo4
	OUGPQLMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJR7W-0000000BHAO-0WQw;
	Wed, 21 Oct 2026 07:52:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJR7T-0000000BH9h-0ez5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 07:52:20 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j7mU2411402
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 07:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uGEbX7ewHLXjKOrnEAwIQ5NuoQ6GYnuPMjFfMhRkmzY=; b=AyQbDhhIrkFWR6Vk
	Qi2NR9JA3Zl2CUV7EWDi6niUDRqZIXrxHan5CO5/E/BXU7ve/rdkbmA1nMYiorTj
	uUnreypvOJoV9NBh7qXqdcP2SpKXHgjoLhz89Rwh0hy6JheE85O54i4M3fuBy9+K
	GPoUifUKk6HR/ZvKSW5RdHvWNFEesfA+HyQp4k8orY6iqKF5XuUB1191IkbZE+8P
	plpke5EwWoQ+7NfxTqbvPFLeYU9SR35EZlpu5h8sxqbblJm3JCdRo8AnJX/ALU05
	F/8Y9yWbh3i75DhlSJm/79KrlTXj29up/7QkDqsFQj2p0RS5n2rG7kpyuT0V4JEd
	ihpS0Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7hvc4eh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 07:52:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93edac58b24so14025485a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 00:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792569137; x=1793173937; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uGEbX7ewHLXjKOrnEAwIQ5NuoQ6GYnuPMjFfMhRkmzY=;
        b=fMWFXAji8ngvjFTVvCubI6Nv/XER51G+BeVJCuo8fsMdWy5n9Sg6VAp8IwHRPgIMzi
         YodPSUb5KTsYQFAJFzvcx4MgJc3SR/q+1dun5zA3mp45/LGuOKrTMqtbSOyvB+XVp0FW
         b4/Sx7J2Y5UpNOcg8y9dpm/Fs8if6QQ2WLoVIR/I8fg9qZX4RmoHOTRTgMiTWcrWoaJ5
         9dcCPZnkHgfu8DJtGt9karo4AFujj/ULVMaHuPJ4WTh1DWIf5W1BU01fz5eqWPBFawyo
         XqVuVQUi0L8ONDuA79lI6Jhtx+9iEVJXI6uLIeedp6S5MhxGn+5Sh6SnCrCYUoZb+GB7
         7ifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569137; x=1793173937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uGEbX7ewHLXjKOrnEAwIQ5NuoQ6GYnuPMjFfMhRkmzY=;
        b=be0tICqIR75mJNd0tlUeQShQiCSkjTHNy9eyM+QSG49apTxmyhodPklu1qz+m37unV
         M3Ay5tCE4Vu7SeBw6wM3o5hnm7e/rsg+oP/oTtg1cohtA2Ytvn8yvhwm9b3uHhOvvlbV
         qhsVgiO8cTl14m8YAb22qb1VHanZEdDkdmmxdw/Ik/U1185PEkO/tSQBeqQKCJPdFXPs
         0Uptb4BbCZdW40FvhZIKVSx7VmL2FHOLIRByNEOF0DGMpSePfSsbB4rSfe3nDlt9lKEC
         otYHAo444NOVoYtrnQohOubFQR4z5foKrqrrJd0xxjDhNtSasHrr0oWWfrwDqoWuhWlw
         ylGw==
X-Forwarded-Encrypted: i=1; AKwUvBxS+YTzSwQEuOMXZD2cPZ/suTINIIZad1t8UFuzhSejuZ76lCWhLimODrlwx4EDon9JuXAMoeELtspiV3twZMQj@lists.infradead.org
X-Gm-Message-State: AFq9FYLsEFC4l5nv0AGcd8j1es2433MW+c5Q1FrSAqRFrHMR803BkMoa
	a25P+VLrG+aEp86z56yebs08m1BDlp48/2pDgzA+efE1lbHTJ9dP70kYA070TcS5713ZZUmWcSG
	O0CgwOzX4guFWaqRZRG4iXIPa9U02wIg6T74dDi9f0gOU2l5JkzOYFXsBgAY7XJqLh7oz9gddGa
	ZPxQ==
X-Gm-Gg: AYBFou3UnXDXAcmy7jpnhu2FJMY3mGq5zWkWWkkREInAhNf7Tt+TSzsFXbSwazU70Xq
	pYe59L2EaIzKtia1SdKIamTfpFaCnKid8uFiKChDzaitvmFwxUIUHpgfY4YwUclkh1pq7EGqKLG
	/sPjq9TastR7gdAET+gkagmGlmptISPTFjgwgHejZqaQXVWXeLRU97iN8LRpNnAXzvC750RAl2x
	IsjAvRPGFBIqLd0Du5sFjan6EzpYThfb55XHm+M06zobuUjgBXPQoDUf3Gq/X2OiWYnQhkl4TiB
	f1GJ1bEb8OMfbr0raW0W+wwe+Osyj09/TFgyW4od0c80glAVC1Y5bMx61wVm+GEgdFMjFMAUKoU
	kdiHNG3EEKYqyg+zjQ/fAvQ==
X-Received: by 2002:ac8:5707:0:b0:535:6cc1:589b with SMTP id d75a77b69052e-5369b4a11bamr23256191cf.1.1792569137645;
        Wed, 21 Oct 2026 00:52:17 -0700 (PDT)
X-Received: by 2002:ac8:5707:0:b0:535:6cc1:589b with SMTP id d75a77b69052e-5369b4a11bamr23255851cf.1.1792569137150;
        Wed, 21 Oct 2026 00:52:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679009aacsm49878266b.78.2026.10.21.00.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 00:52:16 -0700 (PDT)
Message-ID: <08dea1cb-aaf2-4c62-ba9d-8bef2d6d44a1@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:52:10 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/7] arm64: dts: qcom: sc7180: Add sc7180-trogdor.its
 FIT image script
To: Douglas Anderson <dianders@chromium.org>,
        Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Brian Norris <briannorris@chromium.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
        linux-arm-msm@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org,
        Julius Werner <jwerner@chromium.org>,
        Saravana Kannan
 <saravanak@kernel.org>, Will Deacon <will@kernel.org>,
        Michal Simek <michal.simek@amd.com>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
References: <20261020153652.2907186-1-dianders@chromium.org>
 <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX2mHptnII5Qfy
 vjo2eDF9/xfTuKeQtEIsSbV0uIutxKBbP5riNRRZPxQy3ync+96f4joNlh67R4lnwIh030P4OuM
 aj95Ms4KABssUkbyFayRHzlGoJl5V64TeHWG7kQaq8wk8a27EurCmml57bJGxVXI7RU0U+UbZVg
 +LAGqMg0hxDvujhnRWEcv/S13Opmj4DQlU7sAI4yuR6P/y0LSsPpZfdkMwwFduPikolMZZmeii/
 3IZy3ZFYJJ1aeotgddvLmKhKIR5abXEmtvA/HivBaQJ2Nuxjd5xHBqySyt8cQCwlT/ByE4Y2uAF
 zsyLAmR6LJt9WDP3NubH7pydStwJTaMW0hJVk3J1V/ZdtQ/FubNbIzuWou+4oVXMHSRYBWh07Nr
 p+EiSrHsWeC9JDYdUWw6rj7cmXpUsw2gRZbXCbU1JK3DiX/pyTeUAQOnfXOVWVIKtNtZNS17pVc
 yhA5Fl6yOSQOVgGSCYA==
X-Proofpoint-ORIG-GUID: zoxo1DcGRAExuNcmzTu17Qd6K8R5KL3Z
X-Proofpoint-GUID: zoxo1DcGRAExuNcmzTu17Qd6K8R5KL3Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX/1yD4KpitSIR
 jW7v7pFlerYLQPSISiPA5tpH664gBMst49k65Cb/DZ0xz34oorku81DcuwrJ+bjVC8i2RJCfIo5
 HwA2bAqYVd3SHYEPupM7Z1h4cr/9CCc=
X-Authority-Analysis: v=2.4 cv=NppE4MdJ c=1 sm=1 tr=0 ts=6ad86f32 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=hCCUOKFY6uXp-TWS5dAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_005219_210114_8C4DE8E0 
X-CRM114-Status: GOOD (  10.67  )
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
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/20/26 5:35 PM, Douglas Anderson wrote:
> Add an Image Tree Source (`sc7180-trogdor.its`) describing the FIT
> image for SC7180 Trogdor family boards using `Image-framed.lz4` and
> LZ4-compressed board DTBs (`*.dtb.lz4`), allowing the Trogdor FIT image
> to be built with:
> 
>   make FIT_ITS=qcom/sc7180-trogdor.its image.fit
> 
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

