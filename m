Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2E0606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q+RC9gAF;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=duwbX2bq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bhU0YKb5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aKMn93+Pdz1KflYpYZRmRShKdt6jXJBXPqsYlhldJHo=; b=q+RC9gAFV52vd0A+uhV97SuyK6
	6WsQDop8SOiiyMC1zOEk74m6VnlbtAeUYsi+nbwwyhoymmBPPGnqmQYU08X3SKlxOVllYrKAMJB3A
	ngP+EobBdBz7HgXflIsQi6SbrYuS6ln2R84l0ZX2dEyyt3WjO3kAO5H6E94EUT5bXNx99COZbcBf6
	3Yhj7+RRoYe7z6nhGmoxRy1lDIJ9iySXcaxpBJSSGBkuyuo3gOWs2NC8n/KJD8GFhue+DeSqtcp77
	hvv3XRYsRB/uEQSPWjqhGwEvu/krO1rRojWqvm0ouVeNlXfnU/wlzD0H4Zzm4C7zeLriww3eNElOQ
	N4sKPDhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtCl-00000008CcX-1Swi;
	Thu, 05 Nov 2026 08:52:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtCi-00000008Cc6-3n61
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:52:18 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UDkN942103
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Nov 2026 08:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aKMn93+Pdz1KflYpYZRmRShK
	dt6jXJBXPqsYlhldJHo=; b=duwbX2bqOb9603Ifb7XUTLPi79mBxD4P0AtDZQ/1
	k0SSLKBI05dxW5jcl2W9mROYKSNb12hR0aBBCDqIwRid/j7koacWsDufQHr2wHwl
	tb51kDKeRvVlMwr0fLkR8i19Fp9jwaATCbr+Xz9cS8e2CAZRwpwiyBtKEr9bBMTQ
	aYRaXT/V1l4WnrPLESMwRSCzMxbloDMjhItFQi83sb6d6NrkCcqh+CU01pu5NMGn
	XrJxy28HLL6gAA88R0q4eXGg6ofUBwG92fw+ef/Foo6tCQBrhQBv6aFZ6/KW0/z7
	cjpmS9P8DunvZcMZ+E086ULDnmonWlYefxRgRtGz8UuE3Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bj43d6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 08:52:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf7856ffso336230585a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 00:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793868734; x=1794473534; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aKMn93+Pdz1KflYpYZRmRShKdt6jXJBXPqsYlhldJHo=;
        b=bhU0YKb5/PE9IYuYT+N0zBl8jiy64mvjRYgUvHVJ+S+BULDHw/jKefYx1rI09FBMDu
         RXImR+xVq32W+b6qAaleTTwzTf/1QE8tSi/g4HyiB2NBKtblUMV57hTTE5qcWFX6Yw0l
         kjgeLy5do+ludCVPUfCYgY/p33iy5LMbnxk1aTLC/M7s2JgA7a/GZgQXhsKDvwkNFIsN
         4dxExuyDfxNZU31MtSrNqSbN9NeK0hT2cYvlGKse+m9VJryb4EWgcXRHFmqMbWySzYUs
         c2xU3YxfpRRg6WxY03JvOJZe/OZs5Fgo1L8r05yBYJ+vGvb0nue+AAhfmEE/lwSuPF5p
         AMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868734; x=1794473534;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aKMn93+Pdz1KflYpYZRmRShKdt6jXJBXPqsYlhldJHo=;
        b=ATnnOvikUqtzE+MI1bifdbRGEcfHPkZqKOYAxvzLj5bTGMVf1wTbgHBnh0V/849X28
         t8lxMr10G0eY41YO2/tE6UH+5ocpdjg8EH63esTGujh+A2AVJe+BJ20sTRLBovqRkYNr
         FWXEDdL9LkxoqqYZikZSzoGA9mVPg9etsDp7syTGF7gM31N/8w67gg8GuMrw8HZ6nyVd
         QEbao5zlXzcf49xvPuMT3bJTi/396AaoMGpzXEM2xMfipj96lpnIiQxGHoD2yGugh679
         HW8NgaE1Yhca+Sak3FH9zCdj/wt9P5jO43SHdUdVWCkwVu/8nIU3r5hUm9vHV2bIx8nR
         TPGg==
X-Forwarded-Encrypted: i=1; AKwUvBxgrrX5xedGIZGzUhwDQDqmSUccBcia+bdfSz2/f8VRW1ihhfD1I7+xOefOFIFKG84/wOnOg6gKwTxzxcKCJ5Kk@lists.infradead.org
X-Gm-Message-State: APuU4Z+ZU0Fg7PNU1E41Brpufx3nX+1swhCQzaVinCJvBBFGIAiNXB9d
	Ca/AUNXIxCR3mR7MdJBvyQRhxdW4KTMQOP35pq+bjQQ/oofTzcQifI2wIq1pjhhKmlsMaMke688
	okwrwNy0GlLON4iRRDP4O/sZEE3K87lmC7BnHdG8K+LRAhUvlThugcsRWAlM8OSUjbrbYvMr6Jm
	qVzQ==
X-Gm-Gg: AYBFou1vXWcva7RvjaupUNQihvZMPGLQ7MunQCoMfqEoObUV4u70TRX4iZmrLsjOohr
	VjKprfgDf/wf1Ih6m2KOJLQFXg97nLbWKAXlL0XiPfkAOPS/Ql8gNmT+ykLkFOOCRgMJX1M/FEz
	M9sRvEoClvzm+KYJgyRBhnOdu1gwEL9funyOrRvpm3vwKHD/B9WaALr5kmmrvb+2pQfRI70kVK4
	eRgUgMEnBsgpnRuZKIXb4kO4K79KrBM/wggktb3PpHTPtCvrnYPo3A1y4qRRvohXyWMiIwYs3Vb
	rw9RT2OBM+TBsNZCfgnj3Lt3VrL+VzCC4zna0CcdK2HW9lw9sAqgGpmIgMYLmS1odZ7Q9VbycoC
	+Gcl03MrQaBpqLm6SMNi/47qsXVGSe5qlHErMu5vnEXHEbJnNE2qXIK/H6c0qOpU=
X-Received: by 2002:a05:620a:84c7:b0:939:f978:c1aa with SMTP id af79cd13be357-94421581759mr2865812385a.11.1793868734228;
        Thu, 05 Nov 2026 00:52:14 -0800 (PST)
X-Received: by 2002:a05:620a:84c7:b0:939:f978:c1aa with SMTP id af79cd13be357-94421581759mr2865810485a.11.1793868733609;
        Thu, 05 Nov 2026 00:52:13 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ef2e968sm58243895e9.8.2026.11.05.00.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:52:12 -0800 (PST)
Date: Thu, 5 Nov 2026 10:52:11 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Mark Brown <broonie@kernel.org>, Andy Gross <andy.gross@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2] soc: qcom: apr: Reject packets with header size
 larger than packet size
Message-ID: <diddapoxu3cgqkuldldmlbnlmlt3dpin3563rhrie5gyvg74jo@ip7omguafebh>
References: <20261101190733.121473-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261101190733.121473-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261101190733.121473-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX87A+A2wqMDC/
 2+HvlF9jhDzMTwICuPV+TW6PdWV3JzCXi9gnQY6eqSXvcbjzjgE5oxjeVKZEpZq/x4yHTpN+4To
 WfYO7rq1EqJSvBTeHL/Hs0tIMj7Ns2tLp3AMUvla24ZkjxNrlRCk2G+j52+0dYyrUbSwQNlVQtq
 rGvQ1xgF2nARfOyBgfYnUtAHUofhKhHo4FLyq2aJnVlAhhaW+vfFJUT8wgHqtGXsNqvU4vmfsat
 qqWo13vDq/2dUGMCkU7IBpfj+acdBMvXA4LvNB859SzdlciNQ3S/hD+zVezwsqlL8tatld9nU5p
 9HEF5/eoEwzyGdC3BjMXaBInqd7+CxCrd6K+ASjCbovVvncY4jqqNz5ACx6u+DY8/6rCmJhFLmS
 FI9Gu6DcdYZu8MdP3IuRNxB77Ms35rx8J0cmIklKYCtNYBNS6iCPxOAqGChnD73i1eo7Uq1RJqb
 UF0SOekhRrfKJ3YxPQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfXz7lY3MZAZfX4
 InommQI1bp9i9LjFlrSQoPpwb4sUYVSV2khDMXdpRvgTqobEz+E1L6SuZZGk5yZ6q9jj3J5AxcI
 IV4YaOSw2yluEr6fhlKrI46xF8P74SQ=
X-Proofpoint-ORIG-GUID: u9NHVTJoclGJ2yyd_k-JBVbZ65CGz9kD
X-Proofpoint-GUID: u9NHVTJoclGJ2yyd_k-JBVbZ65CGz9kD
X-Authority-Analysis: v=2.4 cv=N/u8hG9B c=1 sm=1 tr=0 ts=6aec43bf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5t2Un5gMkzPXvGO7pNEA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_005216_943787_D0733155 
X-CRM114-Status: GOOD (  13.76  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26-11-01 20:07:35, Krzysztof Kozlowski wrote:
> apr_do_rx_callback() and gpr_do_rx_callback() validate the header size
> and the packet size separately, but never check that the header fits
> within the packet.  Both sizes are u16, so with a malformed packet where
> the header size exceeds the packet size, the subtraction computing
> resp.payload_size gets promoted to int and becomes negative.
> 
> Further check "resp.payload_size > 0" would fail, leading to
> resp.payload left uninitialized (stack value).  Reject such packets as
> having a wrong packet size, although unlikely that firmware would
> produce such packets.
> 
> Fixes: 6adba21eb434 ("soc: qcom: Add APR bus driver")
> Fixes: ec1471a898cc ("soc: qcom: apr: Add GPR support")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-82d40745-1593-4c20-8432-d86099836525
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

