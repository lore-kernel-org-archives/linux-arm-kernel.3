Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5054F606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 19:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dG/95VcK;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LTFS6EhJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S0MunuB6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m0mMRhns++zcKGrTP9aBFlkK9JTY4c9NYzIr6VNARtg=; b=dG/95VcK4qQI+m
	QuHOmqBiOWkpg1rr3lUKSBWSTmG/2WcjM5uwg1DvWNc628dIxcySiiVpUv9XWUTj9a0E0bKEsLW84
	nMVXK8k8nNrXYeTbvyhOWVV7Vi39Pvqe2xft0RB4QRWNt9v+BvdolCUmFb2rh2YyZydxQmHVAdaEj
	60GdG+WbpjD0l7TX56pdHr2y0V9dN4VvzZBgUWscIw/DcS7B6Bm7t9mdUTPYykQksbDbCfjnWbOl5
	gn9Qm+29/K4p9wXvGLZB1hK+rJbNJiMGcws5F1f9ZTiiWa2BllcHg29G6I6YwYQUaNtnt5JFd6/Jd
	nkABXByE+HMlhZnNqolQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2tO-0000000AIZq-0MCL;
	Thu, 05 Nov 2026 19:12:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2tK-0000000AIZO-2aNN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 19:12:57 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeB5t2433593
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Nov 2026 19:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m0mMRhns++zcKGrTP9aBFlkK9JTY4c9NYzIr6VNARtg=; b=LTFS6EhJ9WZlv/J/
	1Er/jeH2zi7+21FYJcFpQXbEM5AYbGgVJsacUbV2u5dBmhZ2HZFmG6Xwk2raLyRC
	AonFVdNlLfY9ctnRw/YTKAJt3BdRll3iAde6TC71BPwwtBd041LiSzGxx+jcfANK
	GeQU5L2S098AfuaCKAsEst7Mnadp5WtGu+YZppJzCr3nShQdsIrfZDtId2G/pA1j
	+gAvA1QLM2LbUAXXbf1oolOrBQmwVNs0D0riGKfr4BsJFbsv1+KkPWIXiN0J5De5
	UkJ8FUE6Lvc5IZFgBu9gPaKCfB6QrBqdlL2jP1LKVE40Fgyk3or7sC7n916pNckS
	n/mK9Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd2dp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 19:12:53 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1af203073e0so3396576c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 11:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793905973; x=1794510773; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=m0mMRhns++zcKGrTP9aBFlkK9JTY4c9NYzIr6VNARtg=;
        b=S0MunuB6WhQEvAVdgAcrz7qcrDUC1yhoyzzLQTk7ydMkK4/cz+msGaHE3a8q1+bjty
         e/jIhAYwvaLVZPrEBhukOa3Dr+Mf1jiUrp59NPmOpEyPBTOOq9JxS7Lrv50eWeiu16Ac
         65VrhZfQv4Abve58Ct7PtofDSBhCikM6Qs7eDyhP3wv3084k7GxUOjcJHfk/77hEM1mW
         j3xX5TdCoASq+0QibjZ00oR+IDK4xRBRd+ro6xyJ8sPmLHJt1JqfjDp5VDHKD/CL2gth
         IM2JQL6GrCr2hGJ8KvXmTUCj7CeT82vLiXNBFtvEjOf0R3xjb4XppxTzUWHmcgU//weD
         QxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793905973; x=1794510773;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m0mMRhns++zcKGrTP9aBFlkK9JTY4c9NYzIr6VNARtg=;
        b=kv7TcQ4ZP/r4iNMv9oxM9E6tWHfObWnJb4jnT/Vugr4ZzBsnSXwUSm78lwWrhC4HoG
         PSYF9znEQq+smar20Y6iaXsuhyjk7IecR7cBN+g5E32l0IHrb02k5iAcTf16mLsK3K9H
         fWwwVUk1C20iouy9S8lT4poj9ldZW6I+EDLOSm+kgnelETIm7Dy9by7YEWaB2VAqX1ZH
         DV6fDkR4C9EgwjhBPO470jU7iEWOm6O6WW7YvgxtCv1+0ichx1OdRxsczBaLH2jcAonw
         /1LlHr8DQA3Qt4Xxe5DSOggTs7ZH8FF88k1ZI1kUNS5ff7jEEyF+V0U/7WBwqjZDREI0
         Dw3g==
X-Forwarded-Encrypted: i=1; AKwUvBxptNHBHHJMecpq9xynLtHYU4vRQ8csGCa/biuJw0i4CsOJFOt5IGuOn/E84jwwkJa1AOlNctzWLczVzthskVsf@lists.infradead.org
X-Gm-Message-State: APuU4Z8Xizg2P0tu00WI5ecX1j6Z3wwosIZ+Cu0tzy9vQ+AbOqOU0p9P
	j983tfs57M9myWIwkBnSAqtt9UXOeDHn5F/OxCc25hIS8pfgY1fKKBTI8lrAaQGTilh6MwE4B8D
	Ng/8VoEHDc0MRlusOr21o6puojCoU9kypLnZd4Huc9jmuH3Emceaot/Tp+RP3NTo/5U+H/wGCVt
	Mk9g==
X-Gm-Gg: AYBFou0vYZ48YjNAUVRj/vkVMUNaUh8mtjleJY+1pZF/1UZ/Z2+phatpCa1ilBdcXfF
	ToU9GFanxDzo0fJ1DtUcqdwFeVr/rMBJQ520ScFr6w0NVCul/X2Z+NmogLQz4LPxcboEAMz6YeJ
	SXSkI65pF7W+BaQ6mL/2R1lSX8/KDalQwfjqS8KTNF7EpsNk4dpRcXAfolWE14p2f6iuMG+S4i9
	776Y/P4w540nOOpCA4pw0tMGEVUiaXtb8qgPX3KiC1l6gw8es2yizXe+sHd/6q73viOeo31iK6d
	+RWpWFlnF6WEdu3XWgUyxQgHuA4bl70COZJOYu5bem5DXNveo1AzPfPI0wkWAjYx4N+qUCm8XeX
	YbaZsGaeGrGWVGrwONoQrktdolmzYd1kWJ7c6DNM106ft18aBdkQlzm4AXadX46xuCT8R5OtFgK
	fhZWW5VKDuC7cOT4vqoziMqOMRDA==
X-Received: by 2002:a05:701b:455a:10b0:1b2:42e3:e5f0 with SMTP id a92af1059eb24-1b242e3e78bmr11296103c88.12.1793905972657;
        Thu, 05 Nov 2026 11:12:52 -0800 (PST)
X-Received: by 2002:a05:701b:455a:10b0:1b2:42e3:e5f0 with SMTP id a92af1059eb24-1b242e3e78bmr11296056c88.12.1793905971882;
        Thu, 05 Nov 2026 11:12:51 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c748eesm17728365c88.23.2026.11.05.11.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:12:51 -0800 (PST)
Date: Thu, 5 Nov 2026 11:12:47 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>,
        Linus Walleij
 <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v3 00/14] I2C - detailed transfer reporting in case
 of a fault
Message-ID: <20261105111247.000074c4@oss.qualcomm.com>
In-Reply-To: <20261105-i2c-fault-reporting-v3-0-515ad74ac4c9@mobileye.com>
References: <20261105-i2c-fault-reporting-v3-0-515ad74ac4c9@mobileye.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3NiBTYWx0ZWRfX6HKdtQ5MdKcW
 Xv6+84L77IUnCFN6C6tdQb9rEICFTt2WubWESD+KCvjqnoCRmSCXXJqUnvdmtTLZLjpa1SfwfZp
 dInIc4ObJRFhLGpuXt902iHfuQ3wU+k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3NiBTYWx0ZWRfX0caKZlKO1yvT
 AC+dRQmV4n5xocZryiUIcztigL6o7l9F0CM8ZlXkwEB7PalzsSNuh9LFRBsBqwxmXSTFeBUSUbP
 0JzH2gUcWtVUgBi9uYbA8u63heGtxwLKEaU5hs+fSWBYSwBARv9TYVejGwbZBRGNaw9nn9WBbpQ
 pukx+i66PYr70TKWsEJ0pZ1P5/xahUkDb8GfIqvla7q9kpnj8JJtEibc3u68adaJSu9UgAWoZGe
 tysmKgF8DLLSEb/SZho8tTHilSrcrTdO+LxOaCQls26rzzPyImvaSfyz6EGHd9gq4kySPOjGlm0
 mxOzGU5Gvg/5+XYP1J0k9aJM7aJjvXz+57FbA5/WhCZNxASEa96tLJmaBFSGiYI7xCfbgTFOob2
 JEX0+vsq/Unn4cpe43tRjZbc+QDDsiZ3Qrjkek/Xsd67XqApcYdZvijdWcJwt4hzFIfAoRJWWnp
 hTnSE02pD31ZmDWnWTw==
X-Proofpoint-ORIG-GUID: 4GJ918fYjjPyj7aU_w1uRB8jIcbUvse0
X-Proofpoint-GUID: 4GJ918fYjjPyj7aU_w1uRB8jIcbUvse0
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aecd535 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=JvO64EORAAAA:8 a=8BD2oR26EWfAhSrP7b4A:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=Qz6KxWHdQ2_aS5WpiCfK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_111256_208044_477523EC 
X-CRM114-Status: GOOD (  33.76  )
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
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 05 Nov 2026 19:15:21 +0200
Dmitry Guzman <Dmitry.Guzman@mobileye.com> wrote:

> The existing API has function i2c_transfer() that transfers one or more
> messages, and it only returns a single error code if the transfer was
> failed. It doesn't allow to know how many of the messages were
> transferred successfully, neither how many bytes were transferred in the
> message that caused the fault, and also it drops all data received from
> target device before the fault. There is a comment about this in
> drivers/i2c/i2c-core-base.c: "REVISIT the fault reporting model here is
> weak".
> 
> This patch series introduces new API function i2c_transfer_v2() that does
> the same as i2c_transfer() but also returns detailed transfer report,
> including number of messages and bytes transferred before the fault. This
> also allows caller to get the bytes read from the target before the fault
> occurred.

Hi Dmitry,

Just for background, could you provide some more information on why this
information is useful?  For kernel side drivers it is remarkably rare to
find a real use case of partial transfer information and the
current i2c_transfer() return value approach complicates a lot of
drivers for very limited benefit.  Sure it is a small complication
to check for a low message count, but you do get a lot cases of it!

That leads to a mass of AI reports of bugs.  It would have been
much better for kernel side if it just returned an error code
on any short transfer. 

Given this is effectively going in the opposite direction I'd like to
know more.

Jonathan


> 
> For user space clients, new ioctl `I2C_RDWR_V2` is introduced.
> 
> Patch for `i2c-tools` user space utility that introduces support of this
> feature:
> 
> https://lore.kernel.org/linux-i2c/20260623-i2c_detailed_report-v1-1-b67259a31a9d@mobileye.com/
> 
> Below there are several usage examples with modified i2c-tools.
> 
> - Unsupported message (max length supported by I2C controller is 2047):
> 
>     # i2ctransfer -y 0 -r w1@0x19 0 r8000
>     Error: Operation not supported at message 1
>     0 out of 2 messages sent
>     #
> 
> - First two messages transferred successfully, the third one is sent to
>   non-existent target address and thus is not ACKed. The data read in the
> second message is available for the caller:
> 
>     # i2ctransfer -y 0 -r w1@0x19 0 r1 w1@0x1a 0
>     Error: No such device or address at message 2
>     2 out of 3 messages sent
>     0x32
>     #
> 
> - Target ACKs first two bytes but sends NACK on the third byte:
> 
>     # i2ctransfer -r -y 0 w4@0x09 0x80 0x80 0x55 0x55
>     Error: Input/output error at message 0
>     0 out of 1 messages sent
>     Message 0: 2 out of 4 bytes sent
>     #
> 
> - Message reading is not finished due to timeout. The data read before
>   timeout is available:
> 
>     # i2ctransfer -y 0 -r r100@0x19
>     Error: Connection timed out at message 0
>     0 out of 1 messages sent
>     Message 0: 16 out of 100 bytes sent
>     0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
>     #
> 
> - Driver does not support detailed fault reporting:
> 
>     # i2ctransfer -y 0 -r r1@0x19
>     Error: Sending messages failed: Operation not supported
>     #

