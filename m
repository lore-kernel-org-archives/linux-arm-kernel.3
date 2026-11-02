Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA1B606A331
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 11:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MU9I8DC3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Kh5OnkeR;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RtCLC0/X;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C4uNhEN2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4mhjs5YiwohXXKlFzT3X2wnGvKV4qOEdncy1Sbc0n2k=; b=MU9I8DC3wUgyYBH9uq/r+++rr1
	sHHJNEVwCD7VXHPxMaftWh3+kJ5brFsK/tZlVjvj/h3a+NOoMIMa3n3yQoxcF+h8+atffMSuSs/fh
	6SomIqzzl7HE6wSAmhxZgUnr+TYstfkq5ywyVC1ampPkThi/jlQfCMmYgiSZlrNJVjMVNlhyrCKBA
	kxrI7qMbyZDDYriKFIcRone3LoezWkt5/Zqxk0msqfoxT8bh278/uiToJTkLlSeHVKtxz49JH7gGV
	M/rxEDPTLBO8tk/ITnlsxV1Ct3I/h64pdOcHL6Q4p7CdVJmj0ornxWCFIdT1eAkYYcjj9kIEg/yIU
	GgRbU0hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqXO-0000000GOAN-3f4v;
	Mon, 02 Nov 2026 11:49:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqXN-0000000GO9i-0hcW
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Nov 2026 11:49:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=4mhjs5YiwohXXKlFzT3X2wnGvKV4qOEdncy1Sbc0n2k=; b=Kh5OnkeRkScmHScCXrdUnoaznB
	6K+LXB9jQNQsdQDgAWnm+3rq0mdX4iEMcpSk33TPwil6SE4XFI+pSQwVJI59x9iET/ztR3HWEX0R2
	gAqH6V+LgYKZQgwrpkzXcIe4XWj7l2ma0Hp4URgRRHiqlT+AGKBG5DXoyIz6bVvr9tBe1AgellJdC
	4ODZXRGWWD3sS1kxv8jopDWtODq/v6wIBBrH3buDPbFebOEZ3MwS3mHQGHxVfnb9+Ewx1k4CZgpUi
	X01Szsw8ceOwgKHH2f5q7UX0GA1SzoQJ9xUwY1XOp76kIHGNGg5ZeVAYOFgcAAxzvAaRrSHnTjuhf
	6np/I6SQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqXF-00000002Srs-2EKn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 11:49:12 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A1Hg2466143
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 11:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4mhjs5YiwohXXKlFzT3X2w
	nGvKV4qOEdncy1Sbc0n2k=; b=RtCLC0/XXANm8zGgprXI3f3T37+VgrKFe5r46H
	2ljNLkoK2gazwDz7NG4AxsRSq0qth/tadAd4VDsMojwF2pGSEUNKi9wNX3hhGRlO
	yCNISqG4tjDTkry06+9GHllYka1MBnhc2Z/Kg2sXl330PxZx0QCmUB0f0SBNKIkl
	dFqhKQrm3GqGFBcrJMheFJx6PskKYLsq0gCymF6MS/+/Yc2qpsPErNsWmaVfvbMS
	yKX6Ur3QsNaNjAdqW9jrufv1R55hkFZBEjzALI5VDh9QYFShvR7lOLvNoXcFRyVK
	PXchsimmg9hLnqm2ZHsBtfmty7dCie4HQ14+KZ63xjIJk/Kg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rhme8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:49:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb98809caso489739185a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 03:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620142; x=1794224942; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4mhjs5YiwohXXKlFzT3X2wnGvKV4qOEdncy1Sbc0n2k=;
        b=C4uNhEN2QsW1Ix1vAfC6fax670Vcz9oFhSQmCZGzaTA9hPa4ekuqCqtoqCMRGgQm8/
         7fD7UkeNhf4kWlQG9vpxuP9DLO1WXIBJffsmfihlQ2iG8QUOzZg173BwPtyduhNIOYws
         7GssD0sIcVq1Rg2Q9IGUYdbK3uKjzykkZIDVEbbEM3eM4M6eA+vxZYwpVnsIQDdtIcCA
         YyZBgJhR+iamtuZIMaJyTQKvyIRPVIIzQiEzB8Ps1XS41G9/IvBUj1WWqo4cMBWrV8P8
         h97P0r+REELS8hU596WUFXvC0L2AWqgsZzAx8f+reOWAuQ/6dphITLKKihyXUeU8MFV+
         Gv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620142; x=1794224942;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4mhjs5YiwohXXKlFzT3X2wnGvKV4qOEdncy1Sbc0n2k=;
        b=idibzNA9L47/PZY+S09NuXwGj3klfs7M3/k0en2c5BSDW1ZHvS5bZC7OskCmVAkwV+
         08vq91lKfSgfTiVmqLWYPJsaq/HeTau4AZYXHiNX3dMd1crSCTJgn00v1dDZgh6ObgNO
         l10oIWv8Mz8JkURtQfjaw51BQYP8lFHzxGjIObHLAutTTg3dvYJIy0l1b97xIk25qIdy
         /FKmog8Y+qejy2/9wC6ildJ/HyJyjIieylL1nkj/Sifvs/kauG+5NyroobjJL1/aD44p
         B/AgFS/CdbHwrwHY5HN/Y60J4NBe25TN6QerI99TK5t7uWSL1Yj0j7o9wT0mhcoHTPIF
         AsoA==
X-Forwarded-Encrypted: i=1; AKwUvBxmnzBjK6Y/DoLbxBSrSotpAq10EHM2UyX/7Gi16aR0Bujkf/XQh5NY3q5zMayMxS/Muu9VWtzlpXYM4o+tZa3m@lists.infradead.org
X-Gm-Message-State: AFq9FYLT8hAz3qUPwDAqKvaRBAGnkD4isw1YeLvcfh2nXR3XMLP2PYVy
	zS6NMYDAlUlLilfRjmGrzpiZW4BpWBbuTS4/Z7KbDjp1IOEGVLOMAXDDCPOVN1BzI/e2MfrgADQ
	2YmiodA/s+gao3+f8leSRcEcXimKSdC3UWa677KHtiKSR2Hou/SwrpFvYqn2BMc6wccTeWst64k
	RY6g==
X-Gm-Gg: AYBFou2khpT3dB8NuCOy01QZCkjLNIF2Av6U+sk4nG+34mPj3LgTbOLNEw8OrbG8Dbe
	wSdD3JrWJa+WOIWF0oiAKZIOoTpeW0jLLxsOwAwUJj6P69eAbvGJflnrFjJzcuolaWfCQBuedbW
	EF9dz6ll+xy3n82EcYkYyZvqf7rpiHsSSBOh4II0Ydj4nzHb0UfO77FrxjWI02M1UtvTVuW9RCm
	Lr+W+8tg3JqhctgvEUFuDaM66QuSkk/FAO2o/b8A1Gda81S137bw/DWoXOdScSLKRGWJqaYJrFf
	66Z2mBicbMi3WiQqlmLbeuudJILurhEsUyegBmREq+j9R9U1vdKZNt4t5VmLnCoLujyDVBJAk3K
	33fHKKYF9A4nRHW10giwJ34FibJYesk2LXNAmqOuNn8RHYHA2ffdcOUXOJw==
X-Received: by 2002:a05:620a:f04:b0:93e:6f65:de63 with SMTP id af79cd13be357-944217bd696mr1528699385a.47.1793620141975;
        Mon, 02 Nov 2026 03:49:01 -0800 (PST)
X-Received: by 2002:a05:620a:f04:b0:93e:6f65:de63 with SMTP id af79cd13be357-944217bd696mr1528693785a.47.1793620141284;
        Mon, 02 Nov 2026 03:49:01 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm19766031f8f.20.2026.11.02.03.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:49:00 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/3] clk: imx: imx8qxp-lpcg: Fix the clock-indices parsing
Date: Mon, 02 Nov 2026 13:48:48 +0200
Message-Id: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-0-1c3fc3fe727c@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKB46GoC/yXNQQ7CIBBA0as0s3YSwKQhXsW4KMO0jiJFaBuSp
 ncXdfk2/+9QOAsXuHQ7ZN6kyBwb9KkDug9xYhTfDEaZXmtlUF7VvmvCkGhCv6YgNCyMFGZ6okQ
 vxAWtsaMbmM+9U9BSKfMo9be53v4uq3swLd82HMcHLhc/CYgAAAA=
X-Change-ID: 20261102-imx8qxp-lpcg-duplicate-clock-indices-828fbaee36b0
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, stable@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1078;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/6v7L1X5u5rSAsDoUAMgtN8tzVeu21cN089Cbw+fzqA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6HinAXy6mtSVoB7DruBwJu7hXFE/BDIQ891NF
 u9vdP09TiaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauh4pwAKCRAbX0TJAJUV
 Vl6OEADNhE7z40I+qslePVWHxtl/AdsZugFLn4PuEOrHRPvc+jIF58nAojAp6nEX+iPYc4HxcrD
 TS+2DK803oF/hvsPqM4EZiU3bQjccKgVC/q37aLailgAC5+/MqUjAa6hvi2hAuKKwr1HNGDJjdR
 BiBOjNEWR0ThVntnnyDAGIfPloFr2/GFXq7MHVcWLe2H6T882hRefFWdTCDuSo4D2qOMFRFMTBA
 wqVerxYDZeTrROZhsC1JgQ8FEkKoAQ0qzzyRx47Gyu1TN7k+Zj30ckCjT0G9gz0YcVzY1IdFyeu
 WeGlSxfatmjQmVqZuIn1hL3LZD3FgSfhlASpoF3RzDpM5ihGWyxK70ReQkVWwnjOFa2Jy+Ygc10
 +/6/k4I0XHsz1tiexy2vycLxkTQTrctIHVyKDTyB+pBofHmW6uGHyKBTmuXKwODdn9TilDFrOhU
 bQvcegjwXTgp7s0thfBj2skwqHBdrw8xLEOUhoYMf+8+5PYtOSZ1YBD5lceTyF/pjHMhHP5tCa5
 9INk8Z+n+4vTm3e/2OnVsJzG1BU3knO5Cn7Ejn49R3GWm2uZ/MOr4FljAbh1D0Im08bXcxN5UrY
 ZNOFF3Ak3PnXe+OlnJvcwzl89/GtpWH/OmSzwwtW3VsQD56FgwlmPscy+r8mjLoc6ob9076XF4J
 9u15AQqkp77QMZw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: wC_xqttgkYH3p3S7EHQXdIdpp3sDKq-9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX++KWhPFmSwL6
 sYcKeDCUl1lx2fvQonPRaq0LcL1o5MepEoBf+o7kwif2KRAfvqkJiOuKbj48208qWNc8X26Njtc
 +QdUxK9tcM4PjuVYVHGhBg8RNGdKNDjsUTgpVPHZ/OjuiFRB1HLIzeya9wZAWmCjo68dLjHRG4W
 AiG/oG6iuLe+yCEFjmeJLppAqh32IUS3jK4naWyH99/tN1QUD0SFBpVA+9pio8sJ0kFGV0byrej
 KoiepTGvrUYfqDLg2GGSbJGjI+aMLpOESw+90fRyIc8SNNgzIoRLBblo9irD7GS/C4CDeZpw6x0
 mag5WJoiDy8n6B7Wjx7wUqUAiRE0uiJbl9SRTU0REVO6hSYT4XK7mH5W0NwokgSaGVI0Fv49fxp
 i/2rXfYUswB8DSN4vrz+7f8T94BEc6PAGxQYo5qGPmRu96VbgVNx1cgX/inmEchRMtBjoWTxrNe
 HFgw5AcN83HuRtxYMMw==
X-Proofpoint-GUID: wC_xqttgkYH3p3S7EHQXdIdpp3sDKq-9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX8O8VSWfM6KH+
 LmLeo+6tyGjIePSvpugrqC0wQ0KiuOUENIAhCb6Vzen7BksVqune+d7+Yws58FjS3TfMJF9CkRz
 UvttyRqZrutRIZMxnyWBtEq/33NZsJg=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae878af cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=H-1XAVmeZCqmBwV_hRMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_114911_258923_845E0086 
X-CRM114-Status: GOOD (  13.17  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

imx_lpcg_parse_clks_from_dt() trusts the clock-indices property of the
LPCG node. Duplicate entries leak a clock and make the error path
unregister another one twice, and more entries than an LPCG has clock
outputs overflow the on-stack arrays the property and the related
clock names are read into. The first two patches reject both. The last
one makes a failure to read the parent names return an error code
instead of the number of clocks.

Prepared with help from an LLM-based assistant.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (3):
      clk: imx: imx8qxp-lpcg: Reject duplicate clock indices
      clk: imx: imx8qxp-lpcg: Fix stack overflow with too many clock indices
      clk: imx: imx8qxp-lpcg: Return an error if the parent names cannot be read

 drivers/clk/imx/clk-imx8qxp-lpcg.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-imx8qxp-lpcg-duplicate-clock-indices-828fbaee36b0

Best regards,
--  

Abel


