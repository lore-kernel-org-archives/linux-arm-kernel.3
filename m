Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E9DCF3182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 09:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uxsIT98AKgzeKLCoDfmcMtFTm6JJY57t1GEPNiKn05k=; b=4UeVzEajRV0JtH
	5N1i74sbEoLG7SttyN/S0dfX3WsEw9WEMbiM30W5rdaDNAt2xW8d1Rb91PMpLKz5tlXFWlYwkPIj8
	nd684TG0RcdXavs9a74LmoMtEy7dF1aDiEVLIHS6s0bjwnXJNRxLrmRCiXnwwbCONRGh4//5IF4mR
	26fv+wHEbB9dKBwLwtMN+sqtGpoOOrL9Ld5tF83s+8+0Sq9LYmhJRmdcFmks+H0/BCe1pmGUAAU/q
	YZB7hzvtve5cK4zKyM8pCLqahD/khRm6DBmF0GESwWzRmEQZHXD4qdAtzMWaBsoqF+XqITOlXvUib
	RDWXo+QDCqVUikPExPEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLeT2-00000002rlp-0GvP;
	Wed, 19 Nov 2025 09:27:12 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLeSz-00000002rkt-21Hy;
	Wed, 19 Nov 2025 09:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1763544403; x=1764149203; i=frank-w@public-files.de;
	bh=uxsIT98AKgzeKLCoDfmcMtFTm6JJY57t1GEPNiKn05k=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=s6HN2fID5S/UpOoEioEzsjWuNbxjF6ziEbzc/SWqe/dGENq8Was4CyO1S3+C8m63
	 RWlY8Hizn1yjNhiXwR6LrT70CD15U6v98WHxINVcnioNQDbsUvznk0tFMIdZNllNo
	 LD1jE2+LMkJ7J9dKgeimmjoQDpg2M36ueXMnwK/h17aAt9vpOzWColAXs0/W26J+U
	 arn+CvdjGs+dyu109gh4nYcbeis3pYgch0Vgsi4lkV2Jk1oC9t+rdyx8Y9BOuM7ZV
	 VERztBpKpFgrE9fU/aBKJd7H4QgLplcjmsIoE04scTkdNeRpJytSDyqhPKe63SBcZ
	 CUdUjcrfwiX1+LQ5Mg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ehlo.thunderbird.net ([80.187.70.145]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N2DxE-1wIS9l0iY2-016Xyz; Wed, 19 Nov 2025 10:26:43 +0100
Date: Wed, 19 Nov 2025 10:26:40 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh@kernel.org
CC: matthias.bgg@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_Aw=3A_Re=3A_=5BPATCH=5D_arm64=3A_dts=3A_mediat?=
 =?US-ASCII?Q?ek=3A_Apply_all_DT_overlays_at_build_time?=
User-Agent: K-9 Mail for Android
In-Reply-To: <bd64ace0-b4c5-46e0-870b-e62f950f4199@collabora.com>
References: <20251117211306.725678-1-robh@kernel.org> <679c1f30-7c62-484e-b4e5-7351a23f15e5@collabora.com> <CAL_JsqK4jvZQTQAXCjPgxBCUiENGKgkgaDgZ680QqL1XpS6bbw@mail.gmail.com> <trinity-dfca2931-a7e8-4b33-b722-c22105569d82-1763485361461@trinity-msg-rest-gmx-gmx-live-56d984c6fb-85gcg> <bd64ace0-b4c5-46e0-870b-e62f950f4199@collabora.com>
Message-ID: <81BC8F8F-91A2-4414-9847-292D974042B6@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QYl+nkFXj3iFRCfUcFJTebjVj/pq1Tu4+4nWS/Y7622nKJOAdh0
 3KiAgVhPIihXHRZx4PXnSJ/CI3mxFtwwYhnbztub76UZDpqW+khZNxiA3C31neYSMTlrEaK
 4f3KFqqd9PJHsyX8O8S6ca0olGa9aQDQ5e7f1C8XQZY5WS/NnrZLEVdJ+fSLDo9T+WMIFC2
 H0zdaZgP71ICHWX69q+tQ==
UI-OutboundReport: notjunk:1;M01:P0:Z4KewGmBvgs=;n+8kalSeuObTxamXdgrZIH9IG4v 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 FeEY9++0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_012709_810835_D4CBA11C 
X-CRM114-Status: UNSURE (   8.13  )
X-CRM114-Notice: Please train this message.
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
Reply-To: frank-w@public-files.de
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Am 19=2E November 2025 09:39:07 MEZ schrieb AngeloGioacchino Del Regno <ang=
elogioacchino=2Edelregno@collabora=2Ecom>:
>Il 18/11/25 18:02, Frank Wunderlich ha scritto:
>> Hi,
>>=20
>> this looks similar to my attempt i did here
>>=20
>> https://patchwork=2Ekernel=2Eorg/project/linux-mediatek/patch/202406080=
80530=2E9436-2-linux@fw-web=2Ede/
>>=20
>> But in my case i added full dtb with 2 overlays as there can be 2 devic=
es (1 mmc + 1 spi) at one time=2E
>> So usable as dtb for bootloader config without overlays, not only for v=
alidation=2E=2E=2E
>>=20
>
>Please don't top post :-)

Sorry for that :(

>That said, for the target of what is done here, I think yours is nicer to=
 the eye
>compared to Rob's (not his fault at all, most of the times overlays canno=
t be
>applied together, he can't possibly know if that is possible in this case=
)=2E
>
>If there is really no other solution to that=2E=2E=2E well, at this point=
 I prefer to
>have something nicer to the eye, with all of the necessary "evil" that co=
mes with
>it=2E

If my version is ok for rob (afair he did not replied on that yet),i would=
 resend it again with similar for R4 and R4Pro=2E

>P=2ES=2E: Strong words contained in this reply are meant to be lighter th=
an they appear

>Cheers,
>Angelo

regards Frank

