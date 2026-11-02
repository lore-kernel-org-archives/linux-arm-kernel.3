Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69BC606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2ckOffDC;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UwFxCH7d;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gslv9StG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iucO72ygHraKKoulvOM5elo/8xXNl6l7Hm5EVeQw/hM=; b=2ckOffDCUBxF5O
	lokERPrp/Lo6wCOXb/1AwD8Eu3yyPv4EsiSI2ggG8VUb923Ld+5QqUQSdS3OSkF6zdoCrMLFlG+cy
	IpK4Hqo8Q7X7iRAZQiSRcmwdTUnzgKpfptc4GDGeuXyjSzUVEjlY3YZPgreAG2tM5ZgDaPd49MjEj
	niMXNcG0RbouvIUBjL3P3C/c2/k8tVK4LMp5/dsqiR6uKKU8goojOIKn8ipvDHVyiF1FrUsNFUxiz
	uloWgn27ksafNo8BN6q8mKSYhm/japa52drcdJLpgssnAq8TaU+mlm+e6Y2zDUsS3UwDAJXUVrLbw
	H2D4yWY3hFh37Rfsr6nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyW6-00000000ISN-0r9I;
	Mon, 02 Nov 2026 20:20:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyW2-00000000IQa-298h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:20:29 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K5wo61696315
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 20:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iucO72ygHraKKoulvOM5elo/8xXNl6l7Hm5EVeQw/hM=; b=UwFxCH7dmNX43b7C
	Eao5uTE2EudGxgy8mshrWaf5p8bP9WiZg+Yrb2pnPRfW0ViC8O9dfn7rzwtm//Em
	2LYnz/Li27+yEceOczlZkDQTFb+i2xPnBU0SPsiqsvUTgm92tQYJP7on5Qeoe+qu
	bCAB6JoR0d2B5IW51NFJmJOuz1GbKbYP3+OWop12ApvAb3/eqBPQ7NxERERYrwqz
	rWWmM5iKRcnWImpBDFj+I6PIVSSSvMajTPrVtGPq0Val7ztS5l5OWrf+/8OVDHjH
	20t89mgGFucjHZrmZy74QTyHTdqKnTnEv8WJll5JClTL1zNPtcC3m92f+XlGjYPh
	Yax9Wg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1umsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 20:20:25 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso4796526c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 12:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793650825; x=1794255625; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iucO72ygHraKKoulvOM5elo/8xXNl6l7Hm5EVeQw/hM=;
        b=gslv9StGsnO/cWHNsTkJ5c1wNM/+S/eEyPQigO0A9Zs/u6XZ2LTXFcaiTKkniRpH+F
         r8HuT+dZ+jGB8yj6tUtYKzDBSpmIOJJfc+bVxo9qMdZPu2+9AIVWjaoaJczL9VrLQMUT
         BT+Be+wJCUOwJN9NNvIn9VOiorrTW8zIT0Ugz/mrBduN1DhPtrF/Hx+jizv/pmVoKLWj
         00zGTPXa6nIe4mq1AyqOD6saIzKvLeASGpeybMtRH5ta4XupNTMMZFb1gJNP+/NrDxt8
         vCDhCBw4Wj/U9DQBXAcEWat8U6ZZc2FzpJf4PHs2pdVCc8lKW2dCL1cQKT69LdBJOdMl
         irlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650825; x=1794255625;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iucO72ygHraKKoulvOM5elo/8xXNl6l7Hm5EVeQw/hM=;
        b=tqgJ86Vq775jhV18nKwWGXX/+vg1TVlZCHo2aA5O8eszkynBToZA/o6dUs3FZQySER
         Fk1RUzbj1WpbMdK6/9D4poIXb3p/I36oNgMD8+4um81GWzgv2unD2YkuSlDSTyJ0OFoi
         fq1yR3EDEDH1cAoSOs01PoKxJpyOq9DRn2Kfv1gyNcQCfQfFpFSv9NO3ogUUGcbuxIQb
         AkrgBJjpRAUMO3Y7DeqKhD4YWQjX8l314O7/9OMLazhZ2YpSNU6ipZGrKuZ4phILUlJE
         076ZKKbOY0WTe6CMsg+dkeqQM573GXPE5hwqKwBO9g6WIvrzUioEj/6ps7TZeuNue01f
         fFJw==
X-Forwarded-Encrypted: i=1; AKwUvByA0wjR5Zr6Ob9G/Km6/9I0q8TM0SjahDd3QL1KdUdsOJK0beDQzNfD1eQ8nuLctMpbOAjV3/ywNk+V0/xZ5IPJ@lists.infradead.org
X-Gm-Message-State: AFq9FYK0UnKWCPn2sKh2XlGcnKZYHhvlOgPZ+0x2Kle3mpH6zAZrbvs0
	xMf+aV6eZ6SxOYSKlQnLRPykpwnQTmgB2MV3UVLDvJck0gSJdVynCkHObJSTdeWHhXT+yzl8ef9
	X9uHrG/Cijiff42Xmtn1GzW3DIPSJVfrBL2sMpA0536tEztps2GQuhyEG24NL0M8XDK98oV2VYN
	ZSFg==
X-Gm-Gg: AYBFou08RXAX6/FLlrXYHWsVn6puHtQpXcu0KnPBp+uwlzIZEmG7P4FysS9ZI1UlJcH
	BTxMKVWIrw0Ev8VuU+m0B11z9dq5QRkP3ixX3xCIxELQVXG2i6VQ1ohc+Cqb5ie28/sU88M/WZw
	jgR98Xm9M+vMSZ0pvvNVm87wZ/h50BGP1G4qa8u9ivKGSujq6IHj9xLmFvQu4L9No38D6eqzaOa
	qKrA2kX0soFg4Id0oBktmfWXM8gG3Z5VvYYwnxUUARx1vf+OyFa7pcdeVs20hSO2b4DEkTrrv4W
	8nmGmlT2bJyDE3aFTuLW9QOdj8LaSQbFyB8GC/yej6S2QpSkG6QPjnGEsT8esYiAOwVsTutiLvk
	JFulgj5u9QTs5AB7+T1bbPPkquG/TNyPcTqikvNP9+m1zXbjrJJin7W/lsxP0wBhGOZknD9nGcM
	Cv3+4UJqvbEsnvB/5070f6fRKxqf0=
X-Received: by 2002:a05:7022:2581:b0:1a8:7b58:6f1b with SMTP id a92af1059eb24-1ac5cfe587cmr20350140c88.19.1793650824390;
        Mon, 02 Nov 2026 12:20:24 -0800 (PST)
X-Received: by 2002:a05:7022:2581:b0:1a8:7b58:6f1b with SMTP id a92af1059eb24-1ac5cfe587cmr20350072c88.19.1793650823637;
        Mon, 02 Nov 2026 12:20:23 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm36146267c88.2.2026.11.02.12.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 12:20:23 -0800 (PST)
Date: Mon, 2 Nov 2026 12:20:19 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "santino.wang" <santino.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <light.chen@mediatek.com>, <Fred-WY.Chen@mediatek.com>,
        <arnab.layek@mediatek.com>
Subject: Re: [RFC PATCH 09/11] soc: mediatek: dram-ecc: add a generic
 netlink event interface
Message-ID: <20261102122019.000021ad@oss.qualcomm.com>
In-Reply-To: <20261102092334.138759-10-santino.wang@mediatek.com>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
	<20261102092334.138759-10-santino.wang@mediatek.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hhVgoTM5D25ogB-r1hd1YT7wsrmtTHdO
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae8f089 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=mpaa-ttXAAAA:8 a=9CeU9Xj6n_7RUCDYDCEA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4MSBTYWx0ZWRfX1P/Fe1nl1md+
 47tQWvDcB+hcW/jnxdPiRY4PkqVvTHQ94t7uhEAFR9ot0zQbuy5Npw71B+Vf6uSQ0lrFrL2iM29
 kEnsVy/E2plZLr0ZWGaJJocMuV/1hovHojtUPEr5aziD0JHfKFZ8qe/+p5TgOYgVqjWLIay3NMn
 j/X3bhzgvdwjtUpLsyPk+4AMpdxdlCbgJzqaVolD7ty11X9ZAFgh85sxKpUrJjz3fgz2cxypmnv
 UO9K4z5QW7NJqO8f9Kno5KOOb6eHMeq00BNWBkJj66ce0/WXnVqFpzAGYQQzWTh6bY/u2gYurqs
 ysDTP72O60Vjf3kQ7qLk1wJfoan7LjN9kN3KeofIcuj8kzF2MmeekA9bgcDSUZdwJBBDjK95AN5
 W9hMU3q0NZ2whpJQN7vdUGMuF/qGhXQAlfdk5l7XIhVio0NsuAJFZYFy/tzeZ/SsY5K0jMbtgVz
 AhlqZkFryCpIRk3hqiA==
X-Proofpoint-GUID: hhVgoTM5D25ogB-r1hd1YT7wsrmtTHdO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4MSBTYWx0ZWRfX1Sz1m4VB5nFA
 qrXsiUHusS2OasiZfABCygK+wewQ6MIETvbkKW9Ysn/cIhBs9cEGSCAfHDNNyBjiF2NgGpbsJri
 fE4edS3lV/Gct7HIH9Tmv5OG0a2N23Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_122026_547862_D0C80CAA 
X-CRM114-Status: GOOD (  13.70  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2 Nov 2026 17:23:31 +0800
santino.wang <santino.wang@mediatek.com> wrote:

> From: Santino Wang <santino.wang@mediatek.com>
> 
> Multicast every decoded corrected and uncorrectable error to user
> space through a generic netlink family, so a monitoring daemon can
> subscribe to events instead of polling the counters.
> 
> Signed-off-by: Santino Wang <santino.wang@mediatek.com>
There is a long history of using tracepoints for this. Why netlink?

This patch needs a lot more background information.

Jonathan

