Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833DC606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 10:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v7eaD4LA;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UqJ49b6j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PBdVOk66
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fJLqm9V4jsOFfA6wxHEcJun15GePDPlJxumBUvgqgGU=; b=v7eaD4LAHPK62B
	CjLiLLiwvblatVYbx3A2woPCeCxzhwGVisF+zgFYKuaqUFmq5psC+Hzd5SvnM0sxxWjIKlej2pfZj
	dTzT1ICxKA6OFSLzIxvnJt1+Rvio8J+1t7zEH0HuAmciwQtHJCgxtN0DTqyPaGFBlflhiH+tK2SST
	VTj9yQhIijdTwd8TzFrldKpLKP6JBP2T/p1oszBn86IaJdGzteqyzBWEtQ+Bk0s6VXzSJI/6uRuwc
	br5qbUJmjNEK2+Qi3lzsoMZTaEjS2Y+ejLiUWZrCkoZHysnWpv1h2GrdJPKyXG+FlmRLjKG3dchuC
	E/+LX7BnYEN7I8oA7QPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0oA-00000006kej-0xPG;
	Wed, 28 Oct 2026 10:23:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0o8-00000006keB-1csa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 10:23:01 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KBpq1642970
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 10:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fJLqm9V4jsOFfA6wxHEcJun15GePDPlJxumBUvgqgGU=; b=UqJ49b6jcBEGRk4N
	SMcg+4URhJJuhk3SeW8bv8F4v6ep04YNfItmRsT7kGdv+WqjQJKm8XECwY4SMr0l
	Cw/OBTIt6b7DBmuLNZWP8tSDKfneEmZ9lmTLN4s83EFFQ2wUGYRQgdk3Qmsx/Sqw
	HmjX8jCJG8Ku0powhzuVEZgUKBbyf+LRYDEpuzykx0+rHBLgnExjTCzLMLuaB5Nr
	NXwXvgaq8a8hJvmaBjuRP02xX3M8WljiBZQ84/2smhW8KyRJ9piZfexGD740N+Dd
	l3uF0WZOQ6TPpfwjtKiQUeG2pXrZB6HgovunNh649Zgzo8MWX738zXTzSIzmSdhS
	B5MMcA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpuh6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 10:22:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f13c143c8so130578185a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 03:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793182979; x=1793787779; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fJLqm9V4jsOFfA6wxHEcJun15GePDPlJxumBUvgqgGU=;
        b=PBdVOk66ArmYfESyJV/lmDb/JMYUpRRlI9WNxwcl0wd4Zyx7HPEgzs3ex94mp0gr86
         Lfqtaa32dhVU19L6zoB1Z0iGMeE2fXz8L5oRP3PEPLRaMp3n3PTrS8KUBuQJNdlY+16w
         xoGbvsfYtI/+fe3LGLCIxLblmS5h7JpGMyGoKFBvhyob1Q6uezMORbddix6Sg8ky7I3+
         9Fr+Vc5KZyjniFZvFHaDxldGCjaBo68sy1I8BnmhYgNGxZ3odJQiCzm1XoraUrRtRn8a
         0Sno1LxeUpP2r4RiX3srUVw5buam1jOPX8/Q9/IbGJT75Ce5aXiDzT7UwmHwBc8x9cmu
         vwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793182979; x=1793787779;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fJLqm9V4jsOFfA6wxHEcJun15GePDPlJxumBUvgqgGU=;
        b=QYJ72qKakD/Af6SsJ/RRjIBg99CWEXZdKSxHh3Sf5BYmeIzAGHB+AV6b21gsCS67Eb
         M15C8XBpo6R//5T97kMdYtxAKbHNDdgr5GCxyzTQBQuud4ZZi2Qyyj2tw7z3+P8wDZoB
         fJR8TcfGUtt8zmLNJyHOME2HwtLzZWOIPVWvagCpPxUIxQfJoOuOH+kWMZrsTAhYTlVh
         65+Vj4OmSJNjHUqqk/yFOClyN8GTV8SZo1VS5HqNcpoehnMcZAgGSdxa1W8aMDrfFHtl
         zi+TMtDubigtwBV/nZQq5ij2Wp9w1x6jjs6LN7ARXIdDOMeZhP7mu5/6nQcgUhFil4LZ
         vykg==
X-Forwarded-Encrypted: i=1; AKwUvBxQ8hyuUl9FaMD7Fjt3LIrcQNxMqsYpiiKm0K1hDwGFe6Jf4VWlYY2c5k//0Uljf754VOtvQPfOwbL0PcBG+eEX@lists.infradead.org
X-Gm-Message-State: AFq9FYKSFN0rJV0btIXApUnPlrwmkwGKDRG65Y209g1VZRXPzf/Vyl+H
	skzekRT7GxRmVHsk3Z6yQDWfEdMwScmhgmAIYVDgb6u3aLG1cbz5/zc+p2QmqVxkj2pOgz4IOEo
	hWkhadv0s9duYhwB0KeqqVLIwzGX9oFtSjJODvEDKpNjQ7NrPRXo6coaHWjupKbO8YeqhfpZCzp
	XxFw==
X-Gm-Gg: AYBFou0Kmnmfo4lKkcr6y4KCxgq5rhOLZscbS4CcLgEJ5v+Yca7NoXjg3KOT9yzaGO3
	A7ukwADH8oqAKI78v2uJLcljFjNGq+p8W4a09mxD+TJuQ5NeNjmXS0HvlZPzvc+iC4+09R+UcAi
	V21kDZOHWEBYaS+rREZzasFUYFFYeIn2bbMMaowdZpUHoRKdb3BQsq5BnNs6jhqkkowiZk1xvik
	Mx2g8sbbO9DzmQNYXxTH1YyHaiPeYohzLKCauD2Q6BZrLOZ9sdUNVpEwXWPQVCMzXTlb0ii5RfB
	5i49SrJX9/RxKL2xLS0to3cngzzBlK4pD933qSmV9oaI4UqyY4yn2xPAogKiyeqOTPal15S3T1P
	x1GBW7QknhQ9YvZCTOeKkjQL0ZwoSPiHKdQ3OipN+gFTnzNUJAPKIDZjSaPaIpd0/6kG8xW2SZK
	2e
X-Received: by 2002:a05:620a:4008:b0:93c:7d49:7b69 with SMTP id af79cd13be357-94408d42e06mr227997585a.60.1793182978716;
        Wed, 28 Oct 2026 03:22:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4008:b0:93c:7d49:7b69 with SMTP id af79cd13be357-94408d42e06mr227994285a.60.1793182978265;
        Wed, 28 Oct 2026 03:22:58 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a976010ca7sm36225665e9.1.2026.10.28.03.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:22:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: (subset) [PATCH 0/7] arm64: renesas: r8a78000: Enable GPIO support
Date: Wed, 28 Oct 2026 11:22:55 +0100
Message-ID: <179318297302.16022.6984836476337905961.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792776697.git.geert+renesas@glider.be>
References: <cover.1792776697.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MSBTYWx0ZWRfX7hVrdeeUHZGC
 8ReqkH6Tw2ulwRtVH+BQRhrPEmJyOv2270YcIq+FG2vjo9b/ZJTanmLwUuE2qiWekdyUx+ir+y2
 5L0dNVwFO1CmqOQbYmHuAZD4mpKUoJp1rCw575+4uicp4fdrs+VKq/h/c4JyZ2PxldnMz9Ad436
 AxA1NqpqlFRhe/ofY9tb1uuwjtF41ueMBXcJcNuSugqfBFaZqIm1etYq9WjqVHZLnVznKwRECgg
 iHly6Rtk/xetcr+wXi5x6OwyIEgBamqMIRqXZDuzWMi4ZvzYBNletD470jpdV9EpOOCxSZi9Wix
 9xFSRHjjw66lVS9ShBh2s501MdOsE05kFfdDDdQE5wnslpmRIBd9rGSH8pYq4uRoK/8mOmejGi+
 bV9MC6QxzcEiJSie1ZunhXuQPONM7GH1uh1XJuDWLiYOxQSh8mrEgFGqIraMGUpHXuzSULRftsi
 EA7wX9YrGOFTm3rmqag==
X-Proofpoint-ORIG-GUID: lVC_mxzVa5odSjPFoBlF8bA3B66iEhDI
X-Proofpoint-GUID: lVC_mxzVa5odSjPFoBlF8bA3B66iEhDI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MSBTYWx0ZWRfXxTHIXawifkXm
 1E+gUjYUt8rtAmFDRCzs2ZhizjVwvRAuRNktLu/2qBKnD/NX+8cLmBYTjmwfCc+S6d1BcGJiZqA
 AJj+Ys5lXVa3al/o4cquAOnKUHXbcrQ=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1cd03 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0_pEspLTn5AsfqPZqEwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_032300_454780_B879788D 
X-CRM114-Status: GOOD (  18.79  )
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


On Fri, 23 Oct 2026 19:50:38 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series enables GPIO support for the Renesas R-Car X5H SoC, as
> found on the Renesas Ironhide development board.  On this board, clocks,
> power-domains, and resets must be accessed only through SCMI firmware.
> 
> The series is a bit special, in that most patches are not meant to be
> applied upstream yet:
>   1. The first patch, targeting the GPIO tree, restores the abily to use
>      the R-Car GPIO driver on a system that does not have pin control
>      support yet (pin control is not yet supported by SCMI on Ironhide),
>   2. The second patch, targeting a shared DT bindings branch, adds GPIO
>      clock definitions,
>   3. The third patch, targeting renesas-devel, adds GPIO device nodes to
>      the R-Car X5H .dtsi file,
>   4. The remaining patches are marked RFC or DNI; the latter depend on
>      code or DTS that is not yet upstream.  More detail can be found in
>      the individual patches.
> 
> [...]

Applied, thanks!

[1/7] gpio: rcar: Convert to gpiochip_generic_{request,free}()
      https://git.kernel.org/brgl/c/5e826d71d4839d8471784d968274823f1f492eb5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

