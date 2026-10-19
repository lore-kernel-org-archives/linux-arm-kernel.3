Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A0E606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 21:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uaMoMjx5;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NG9cy6sQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aboJ2ulE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blTjjTu968skKectCc+Yq/rOfNGyGv4vOrqn0909Bn0=; b=uaMoMjx5WB+B0hDdITNT5DWk47
	zAnqBSyaeohoWdGXhqkbGWsKBQquf5lT7IZjOlWbMudlovyae3BokLiXntqXqrzP02qU4Qq1A4dTQ
	nYS8rO0VAJidY8FUZ41ZrBRm6jl/mcfFm9PbghKE0nWLV5nw9mo3QDeAv2GPDVmggZbJ/06DlKZjC
	iB6XGd50BibWgVPZLHTLqiRplLiLFz04qX/itL5Sqf791tSvzNUMFcCouLQtdZs4t+Q7EdRljgPev
	G6YRVHVGfAnLylHcTZx/7W3YXZ47CBNx6D16wRn8kIBcWD6YqDK5AphJ7/xiYKYP3PKbM39CZkF6Z
	MpreMAPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIuWi-00000008M1J-0w3M;
	Mon, 19 Oct 2026 21:04:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIuWg-00000008M0v-1bZj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 21:04:11 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JJK2eZ3328518
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 21:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	blTjjTu968skKectCc+Yq/rOfNGyGv4vOrqn0909Bn0=; b=NG9cy6sQH8ZkfYkG
	H9XN29jQrzjrkPwM97s7ROfLzJ4085SGyOHFIPYfqOFgmvx18QlIM0mcN9CYhPR0
	lue6R7/7a1g+mterYAsZMRmHr77CAYcI7npMB6EjJbssC693Zq1Dgft4FBKZ+pGW
	R8uaqXhv2dxCpxnGl9RyG5AiFjj70fIjWTTn1O/jkMac8LvkKK+TwE459/mC3jGF
	FgkHFmnEbMaz9Oii/9Ivak9rluRfdDSoIwYppb2L1XtOFhQ3gIxzPzU4Sz0tWjjU
	lpqbfoeTwgUWv9F2G72fc6SuuXQLTWQejgRRQcA2gOjnexmsSwV5f2k6o0lJYANE
	+uz8Fg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdkmfj11v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 21:04:09 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35a04491c56so97095eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 14:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792443848; x=1793048648; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=blTjjTu968skKectCc+Yq/rOfNGyGv4vOrqn0909Bn0=;
        b=aboJ2ulEd+Lx3ntso6q8CQ4+6bvNq+YKIXkEROcOTfwIBA6Ep2ZEu2EN99UfRlKV6V
         OzRsDhS2URmSkLvVsapIO5YGuCdKJXAPlrr2WvflK7hXhxpHx59qsVuT2ARUpD1D4tsJ
         PdtlI40iFkINyw9zSzP32PI5Gj0sPVHFKmO/sqLDdgcU+iZT/7Lpi+YZ+qLSRC8axmcC
         jjsmCjnWE9fQaL21GhYlFoSY4eZGfnU0dMOYuV4rjedXslyhERZ4hE2WdmhgaIQAHREA
         AbZ0nGJKbLmJXeFtmwfc/CS4/1hE1/+mqFYFJIl19kUV+ZDAWgaKbI3T2OCQWO3jbxhP
         EbQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792443848; x=1793048648;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=blTjjTu968skKectCc+Yq/rOfNGyGv4vOrqn0909Bn0=;
        b=V0jEiQFhqYvTCyEaPze9+XNfg1M3lGAb3WK6WX3cpoBLWZq3i+Mj0amXgyifdgFKXJ
         +NfpRZ4jJ/P7bGp+WUkwxpmldpzBAC+l+qdXZ+Rcl5P6aQSaMdHkv/fJGcpT3oH8S5zr
         Kkskt5RyOGd8TDsnhyAOIjPeeVLd3XBvjZSvCFRDfC30LV5eR9y4+4gpKFN74GcDqOxw
         4rby8MqhrHqiUTIHol2GbZW7cATr6sSdmgzSYBw3AukQ59s+ZGyrLyzm9yoJpYFal8QK
         cMGQ/c7wR1J/VeXNtV8LGsMih9rfjFdUR2XpJp3lt5ssIHuZcWpgekCNAAo/fXFXYSFe
         5Rig==
X-Forwarded-Encrypted: i=1; AKwUvBzPqtlKDgw21EtZAQ2P7ckTq+sjKCoHQWOP9AexsiKFQO5vJ/1HqQGwvdRMYk2A+RimsQeK/usMAnfsVXVArnyh@lists.infradead.org
X-Gm-Message-State: AFq9FYIOQQPwdeSQkBpCyNQ96mK/pg13xgXSM/fmUqnflCj1HRMYL7xV
	I3TLtmb6kMPh7FdhUPOXlp9uIKs652/Zk6oL8BJMO9H9Gsjzpd7PekkjoV4NmEyDVvsNFBphxmP
	HEkB6k+rxXMnHKJgIDAc+CehHvsiOwwjHgjwuFMvvMArCyIdmruG0zrXJK9kZ3rBXhQ07AHmUHQ
	IG0g==
X-Gm-Gg: AYBFou017fHN9NjVWF6U7Y7TgRk9PoFC1hx2XCGdeWLgVyVCxDAP57LjYP470E4pdjr
	AW/Xaynz/TU/zfqtNplVTyNpgI92fs5tgcDdlZPPikp9ipgLMeShMzy5KSGtKBq0l5rzmAQOAtl
	1FaUpMItRMx7pDxmghtEndqH3kkVoU3k+JUZyL+Pw/pEQcsmBDmhhWX3kBE7QrBN0eGFwrR2vVV
	Zct8EZhkIict0wh+c9m725P49HeQzoGrSiwEiANmQNtCQdglO0wkfIEVLGMc6Lcg5HHgLKVu0DH
	Xv067fREKKU8lALBFBsrFWa97Fe1ivLFG2RSebWRy0RsT3BOHtCQzvCVZr4TfklD9GVBaKxN7wF
	RQCkJj9cxbvKd2Z+2nyKiLcILU0dnb8F2RnF/DVXmsQ==
X-Received: by 2002:a05:693c:8214:b0:361:a195:c46e with SMTP id 5a478bee46e88-365f83a0701mr382438eec.1.1792443848241;
        Mon, 19 Oct 2026 14:04:08 -0700 (PDT)
X-Received: by 2002:a05:693c:8214:b0:361:a195:c46e with SMTP id 5a478bee46e88-365f83a0701mr382370eec.1.1792443847154;
        Mon, 19 Oct 2026 14:04:07 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360826875b3sm36508652eec.21.2026.10.19.14.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:04:06 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:03:57 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v14 06/32] include: trace: Add Telemetry trace events
Message-ID: <20261019140357.000075d3@oss.qualcomm.com>
In-Reply-To: <20261016185553.2794459-7-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
	<20261016185553.2794459-7-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: itysNSY9fQvPNl3Iioc80JNd8UobIswG
X-Authority-Analysis: v=2.4 cv=O+isLx9W c=1 sm=1 tr=0 ts=6ad685c9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=qlR7w6QO3uULSQa8ePQA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4MyBTYWx0ZWRfX8xqapmEfpygW
 yM3471lgm8OX1JhN5aBd7aUWED6AN535ltl0D0bL0/gjuHeSvEP5W9nSYfO332Lx2Wn702Z+sKg
 Rerxc+XxdrVaoDtfsdPfFK8xNkVBjIyAR8/22oaRkwlkRE7zqW74T678hQacABkTapLFYPsCYje
 cWcCnmZwkYbol7DGfPQyQnOyXHIa4Y2QBM/10lsrGzbMyBM+Dvl8K6h4AKtz4HmmRJW27QPDZ+d
 DyMb6ZLEDMqt+pW4fsXm4Z/zRSXqTwKCHB1vVNw/ePIZjctgB6bLRuIttRGBgfiCBSW1X+VmYKc
 arUrEhREfFy7EG16sOQsb0/z/OHwkZJn1o43uDUbhPqrH0fpIYXJXzCbZOTVceckrbZzagRoqyT
 kuJxqYxLjK2cRIYTc6KXDdDEgzqe94dpE22uTqOZP0LAixqHaHWf2XTVwRv56YjRdlk5hJRWECE
 pWod5hdQMvrOk8aPsbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4MyBTYWx0ZWRfX0ondiE3k+x30
 e8Mvwa5KZGjr5WJVTioWaJWdP45SyvCmZWP/mSYNNWZsE/PJZPb0MQQgFKmQ2WeCvm52im2a/nq
 E9PTu8hulOfOBzsbcxWkn5oVCmjTmzI=
X-Proofpoint-ORIG-GUID: itysNSY9fQvPNl3Iioc80JNd8UobIswG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_140410_561257_025727E6 
X-CRM114-Status: GOOD (  10.68  )
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 16 Oct 2026 19:55:27 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add custom traces to report Telemetry accesses and collection events.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Fairly standard looking simple tracepoints so FWIW
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>


