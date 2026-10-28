Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61499606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 09:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b1SjGW7X;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VJjoPXSN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Por8Lfnw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=H9WSVSzQM3gxoBgbW5KOP7ComFae578ztsE1a3gy6yg=; b=b1SjGW7XpMq7wi
	hR0dnkmHcUIfLhtmuvg/jD8GIAdTKPBAc4ZITOSfBpJAIlDV4aQONkoya+HlwNso+zMkUZGTzGTil
	OOY2eM2O+DCXxzU+TvMf5V7VgX78MnJpDR78TbQmFdsjP1Z95DYVgYfnud+/ZS4PO5zNvF6qEyYCd
	28Pr57ZzvpVbOXVBP7mT70GRpEarm7IrXjwS9BSJ+cyukRsExhkPUjk5YVFkfociEVTyr/MgDTmgH
	lNNXdQOAD3nXJ4dJzFUzKOAFp1ASAycUVh1QdiQt0GLdPziE6H/VULsP8vgvouhVYWBGldO17Ya2y
	fkB4R72gYD3FPVA3Gvug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLzzl-00000006feu-22Yu;
	Wed, 28 Oct 2026 09:30:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLzzi-00000006fe9-2qeW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 09:30:56 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8h6mi3768073
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 09:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H9WSVSzQM3gxoBgbW5KOP7ComFae578ztsE1a3gy6yg=; b=VJjoPXSN9HaORW0B
	rdlqrIiuJJPmf+hFREacFInMjBSuffov0c+nPWdcB6GxYX9lzR0vMreJY31GbWm3
	TjgcDz9pCJKT9Wwcog9BhQL+9XV1fPyULxOYARs+hAbH01l7Nbb7yetYf186N3e6
	oSCWXrmjD5x0gl4Fhj286Rqpzu1t76Pl/Zsq+YGu83gpr0GqnYMxhY66OVJ5/wAL
	mQvb5c78yoyjhJA4B++5G8iP+wePlRuXFyGvh4MpGPNa2xE/ikt2YKIK1z/kfUlI
	YSVd3DFtOGN1BeQlbo1Ojz0cHEm9L8/JqqRxdxlIB5G88QeAGoAvJATC42dTyXJr
	4SvpbA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp05q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 09:30:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cbf2fd504so109690085a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 02:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793179852; x=1793784652; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H9WSVSzQM3gxoBgbW5KOP7ComFae578ztsE1a3gy6yg=;
        b=Por8LfnwpMqAqZljfzuHXeSDXavRXyODproJZIixcJOiK5cmYXOEIqgJopiHCFq7zg
         v4y4LM07BqFtjvHdOs4NFYupJ8RzyNKnG3YaRofiRIo8y0roAV2dWGhtEGMI40S9FdPf
         65QlFcOZKHu3qmNOtP3CGvwpc4WqRCjJNkqi9y3T6o4idyZ92GMdkUwxz+Ys3Du6DbKR
         7f+GxUVzm3K9S2YrT9RXDSoYwwXqQ6qc6Sa6ztHYGL3e2aqV4tNW4/E9WTzaE4b/AwsY
         paTvsLU2lMIyknwo3N0US85+efGZdFQ9/nvlZsnRia3OEsDma5/v6zXoe1pNzID6ggSZ
         JeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793179852; x=1793784652;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H9WSVSzQM3gxoBgbW5KOP7ComFae578ztsE1a3gy6yg=;
        b=pgmFGm+uR3h6gfhcUCeVVjJoqBWKYFtx+3wAm4lnySLI5vb90aBjpxfOVnIsqyZyUq
         BsEfH2kFI4yZfA+RnlS+wV7VYeDTQQtBqVO74G+FY7/j1rNev3KyySVuUbzFjulOqEte
         WgR5jF80MRaDnUy4XPloZssy8yubR8JF+w5dTA8wv1CG0xT/tbx13N6MFyy0VRy84h6M
         GfzJSwq/n508J2OSgi/PNEjkmzvcfQUSdL9lt5F+vvVGgWmTuUp4DIO1DLrdykzZRxpc
         tVceP5odhSPVDHrveKnYdZHxiAoSb2UiTtXYh753byIRpAsojBBwrHSW2zrXJHcdd3kG
         nWsA==
X-Forwarded-Encrypted: i=1; AKwUvBzrAzf+Unj1dDL2mLC8IZeLMIvFzxzSsc6EFXpQXFgivDnm+HESUpVfFE4fuUUQ3eJu7bZUQ174Z1SpkvPU/vJm@lists.infradead.org
X-Gm-Message-State: AFq9FYLox/m1JuGCZJeM/10ytMFf6cZeXMKZWr/jo9eN7did6bA+V4lN
	lnhJPMfJWWzpxqNRetNNLKpZYya4q3WltKIxmDBTrm59yUSoUh2y+S4yZYTblAOIpfQr8tWjyl/
	73CyTzhFVOXIACQiZVag1PWUmORSfXRUwbms8HTWCQnN1jvrsDhX3QiUaHJqVvQMpDe71aV6out
	sCnHmXfPCWpw==
X-Gm-Gg: AYBFou3ubAPtrPK0Ri7I9GAez+cd30ACiqDirynf95qCKZOS7K/Hba+/nYUga4qdBCY
	JmlONPNhArCTEgCBaNyEHoCZ1yMpQgE0e/WrfitMggQiXN4GBRKkxpZGSpVnOCovVf/h4BJjTPy
	V66wd9fM8TwlpHUp/6C4TkDMvcxut9vw42jLB9XhhOPkV/K8PgZC5R4R7336GzXVxgyZnBKgyF2
	P6OqUM1jOt4pa0KnznwqURRMFlGGCc6K9+bJ/A+TIZGKfGWRJb2ykf5zm1MazXpfh/TV/cM+e/c
	56NCWhtHDi20U+9kkcrIJx/TrSZn3dWy3ybCQJ/7JmILbran+7Wuyu8zA32MFrtHjGryQMpkp2V
	KMS4IanKzwtZTcQixmKN+jQPo9KdknS7G/S4PKfgAPCL3g7uWdm9jQO/FDyhsNEGwpaAdkiq6bs
	hC
X-Received: by 2002:a05:620a:1d03:b0:943:faab:aabe with SMTP id af79cd13be357-94408d43a71mr195776885a.62.1793179851888;
        Wed, 28 Oct 2026 02:30:51 -0700 (PDT)
X-Received: by 2002:a05:620a:1d03:b0:943:faab:aabe with SMTP id af79cd13be357-94408d43a71mr195774285a.62.1793179851499;
        Wed, 28 Oct 2026 02:30:51 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94e4be4b2sm21772175e9.2.2026.10.28.02.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:30:50 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Jianqun Xu <jay.xu@rock-chips.com>,
        Cunhao Lu <1579567540@qq.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] gpio: rockchip: Fix debounce arithmetic for GPIO v2
Date: Wed, 28 Oct 2026 10:30:47 +0100
Message-ID: <179317955938.10111.11780019305484547923.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023-fix-rockchip-gpio-v2-debounce-v1-1-f1141bd5b58f@qq.com>
References: <20261023-fix-rockchip-gpio-v2-debounce-v1-1-f1141bd5b58f@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eYxb3Bj1gVjg1eN-C4f65SPcUGya6pm0
X-Proofpoint-ORIG-GUID: eYxb3Bj1gVjg1eN-C4f65SPcUGya6pm0
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae1c0cc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=G63kk6RMYl0S_NIbZfoA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzNyBTYWx0ZWRfXxzUQx3AZFDSp
 GdLyE0E/nlIZ6OuymXCOFfxWFY9UPq1bUEn1P+SuoqrM0ESxu2yQ9aD5Q31YasRUWWO8dAfU43v
 joDqLOiQXHGNQghBnVDK20icFbcdkT8e5S/+rmPGQ+UIQE6HFwEE20lM4MHO/Wx+E68CPtmTr4r
 mFfICR12hMfgzi5uBVgDJqUQTkI1i+OmGYF2kPvqahBmqN2c/A5Kfn/QUhmo18jVq8NN2xLklal
 RJvAMiozvwOuBTEmayQkssq4FLe4YcLpkQ9XP5kWHbmMWk6qkIaeVo68u6Jy+aCXIDxEBM/eqlc
 fSHifn959sqcpgcTanBiydoetIKbVspt9JrizWPnRF+r1pm1Gvf+D67jcpRrQgMwgxzO0rM32kf
 jwhYStYKtYOYADlM7MczX5oC3yY3Vb/gIAKz0yClNdH5iwNZ1S+SD1EkPGRiU2zxQw/Ij6fluNl
 MgpmkTiceOlrMOihStQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzNyBTYWx0ZWRfX9kiC3NCWzYMw
 p+tsWZti+zqozcSATyIm1sTwTJp+6M9ZUEMO2Q9DEYfDJs11DyKOjMLeoHXk4jgx4FEWJm+s64o
 Qgbg0Q8g2sjdBS6qlMN4FwaIdYsDKwc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_023054_837286_67F4F4B8 
X-CRM114-Status: GOOD (  12.62  )
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


On Fri, 23 Oct 2026 16:21:05 +0800, Cunhao Lu wrote:
> The debounce interval calculations use unsigned long operands. On 32-bit
> systems, the numerator used to calculate the maximum interval overflows
> before division, while multiplying the requested interval by the clock
> rate overflows before it is assigned to a u64. A zero debounce clock rate
> also causes division by zero.
> 
> Use 64-bit arithmetic for both calculations and reject a zero clock rate
> before division.
> 
> [...]

Applied, thanks!

[1/1] gpio: rockchip: Fix debounce arithmetic for GPIO v2
      https://git.kernel.org/brgl/c/13467fd6998f5da4f5b4f172f1af3d9c48d5de8f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

