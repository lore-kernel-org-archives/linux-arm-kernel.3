Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5293A606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 10:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LzB8jDwv;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BcgynjsH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AfnscAcW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YjAarnCifburoEXGvsqsh/sxDLJBq4lP12OGzhjxpF8=; b=LzB8jDwvE+qEix
	QMsHz3Hwahur1KIWHJg423PyAgKG2+UKnjkQPgH7brx3Gwy0hPURLfRgR4B9eKQFgRSh/CAICn+XP
	uwEr0TxImMJtVRTF/UEY70jq6b2tCeqnugVjR460iVNmmjbVH23tOMc0JnPw3t5WlmA995OV5LoYt
	hDG7OTf7ylVoKDZr7p9rn9Lb9tn1muYsO5++001hwulxXrFJN3jsBany8ZOJOj9wvcnbwNWYNRg+P
	JTGKKs5+e8AqFk3nHv3uUfGFFY3IoSftW0yGLu6DJkdvey1EbqRqiiqYcwv7R/+ZZ8dLRbuDSsfjj
	mX8JWRRw+jjQyXW7sR3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCMI-0000000G8ct-1rFE;
	Fri, 23 Oct 2026 10:18:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCMF-0000000G8au-3pWG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 10:18:45 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAYHb2965961
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 10:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YjAarnCifburoEXGvsqsh/sxDLJBq4lP12OGzhjxpF8=; b=BcgynjsHOsEyW0p7
	JmBaDsQ6nFQLkANcOVu+eCxU9MThVEiziIsFIThVRj72ESReWsq/2Fjlue6EMw7f
	QG7t3qTn0WrzVdngMbQxjibzLT4HeKhh3qX6VnfwOLHzcXvE5ilS23eCh0gfEZ3V
	gJdN1CF7iZTXsVzV/Da4x6OyFDP+nAvYJbtvKk8g4DpMYruI3A4MmZNNGmIgHFuh
	HQLr5vagq7d9LX6Hl5Z7FUUkE8k6BcGB7QJFrW6hfi9MgYUijr0hAVom3M6rkMS2
	cyyjxy/uNB3eb+d6uEcH7zV8JdmH2kJx/yvZVhQwRVX0UqIOddcFZnJf/IIQ9HG7
	+vI2uA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0kptb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 10:18:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so134089185a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 03:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792750722; x=1793355522; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YjAarnCifburoEXGvsqsh/sxDLJBq4lP12OGzhjxpF8=;
        b=AfnscAcWuC8TUlxiLs7NTryZUEKkrN2Iq80NUbIlno4fGJFn5tywNKVR2bjSos/FQE
         bwwDuVCJYOyZQKERioWzv8IbBdXwfhWLPx6I+aTiGceUsaIdOuHcSsnTssKS8lVUsAkz
         zvA2hWkNgnVgaBMnccHWBUJoIINGA3v9KO/F+v8p90HwnTiJUsaxmJXrJ7I4wow4452g
         PCfbYTTRvbC6EdmGSfMAZQxSp1dBrfLJAnXMeb7jvSz9ppeysDVcRJaF1NP4fic1bRHX
         jQDoNb1mGBHIqHDIo9MhCvfjr7EyRnxlu33Hu0U7DI/VWQlROMef2gVfU6e8Zy+JOe3o
         sWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750722; x=1793355522;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjAarnCifburoEXGvsqsh/sxDLJBq4lP12OGzhjxpF8=;
        b=j0jMaZZKEeawXdlVKFWJ6KHwgbtRnQGbXPgRrK58v26E+DJf0XtRI761+vfGuDW9pL
         H865xnfC41T3chflcir0sRMyLfsCJ7xfmdEzVQ/lEzY5x9sqVKvpjlvg611/tl9WLdlc
         ysbUGYBOagX7SjSGfobbfEQVNydZpy31t30yZ6288iVcyvOiVAOfZ841xaODesPoMHbk
         Oo34lpUwNCn0o56+Q339dgy8IJHpApUbxz+X/xC5CmQnCeqgwLJYgux5Sa1kizZlC8Nf
         qfB8ijReZ8mqem2At+6NGxS/+H3lROyyrVLtNJo/3VGnTiDiA8LNArIq5UuYaRPuj/rI
         BMkw==
X-Forwarded-Encrypted: i=1; AKwUvBxIE06WftnfblWldw9SLXisfMYQ18xvTt1Zmmo1GrTLZMAluG2qhqQdnqlnca6yHvOCEbqUMC9U2vVZtZlUO0lp@lists.infradead.org
X-Gm-Message-State: AFq9FYKXtFi3AHJzYGXG8oaIoexfUygAL+/LCST1lFjtnqy7p7KjSC8I
	Lgkbu8xDFtstYSwzYmlVpCu8cZ8ZGyrXOssBKyv45GV8fDOiZ3iWKcA5zs1amYgkFeMFWvecALi
	4W6MwIHcWpRnDotgfcGrN5tgXw6K+luQmHUYeOg23kdh9z5FQ+pIneNY4YX1f4My5kkPjMTA8Hs
	YrAg==
X-Gm-Gg: AYBFou1d/lA/J6aLlx7KKDQfgo6U0MkPq6ITWt3Ov+LDUQ+jXTrO1cNJAEHHXQ5OD0f
	b79o7EC3vD4j3H1wL6UcWyYfltR38jRouAT3n4CNSSy0sOHb4vLH3qw/r7dKl0+XWfEsaJb01M1
	Xj2QhlLlUztjfnOqLDJNQL8nmj5uXA6g1TSixd2Xsju6vG+GBM51QxLjOZD6pPIJ/tfpG/zixLq
	alpPwyN1Ix3jOUg+1Z1x5z/PPtLpjuD7tR3rKTFeN6cDb6WAjwUAfo9gOtB36wtKPJJ1ZjMadHp
	1DRsYEDY4iRK0+yAxYnIlC73hUIIepSWw/sxDrs1cq69SN8KDsD+52Jjt+vFj+3FY1ukB9kxaNK
	59zvGxt4kd7PUQyEyoh4WmPPnVhM=
X-Received: by 2002:a05:620a:298c:b0:93f:2ab9:729e with SMTP id af79cd13be357-93f6f79c238mr362489185a.21.1792750721738;
        Fri, 23 Oct 2026 03:18:41 -0700 (PDT)
X-Received: by 2002:a05:620a:298c:b0:93f:2ab9:729e with SMTP id af79cd13be357-93f6f79c238mr362484485a.21.1792750721242;
        Fri, 23 Oct 2026 03:18:41 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38053b8asm3894504f8f.42.2026.10.23.03.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:18:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bradford Love <brad@nextdimension.cc>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-media@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 0/7] gpiolib: kill gpio_request_one()
Date: Fri, 23 Oct 2026 12:18:38 +0200
Message-ID: <179275071555.146035.13882849400290683549.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3i77rYgpqgW9HmzcJFtmhWbHGV1R5dS4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX3MvtI170XLjf
 GzjQ+K+lgLeZ1e11QfIpgQUouTcd7mC99nHyIdxKi3i2uLk4BctKI3XawAIwrGYBNjkBPliEjnt
 BRgI0GnYenWTeWUgaLjTLdPGlenFtyFtKdpoiLksDUvORyvwlSCoMKLC3Y3aU2bU28iU57l/bqW
 +oSxTVx0tjwZcbKiYTq5VwSndIqeRZpT/e/6dR99777BVGx0lKc5eQxuW36SxWKl5ZQo2LN8qAr
 zCguLCzl3zKQ9M1bTqIM9QnRq3GsCuwsxy0BgC7m7YMaPn4v68zvRE6PUJsaovKcSC4yPw2Ee9G
 y5cHhZPsZbXt7t69ny8KrG3sSs3BmZOJch+G31aIOwECrKatWkKjblEv/L352AvqByscONAOs8R
 k4Ns8II+WmYaXg+1ZbwmB+W3qP0bYJul0KPRfJCe+9M88hUTG/RacC9kvBIGN8ZaeVosRuO5JbQ
 g8SnvGGH5pththHC7vQ==
X-Proofpoint-GUID: 3i77rYgpqgW9HmzcJFtmhWbHGV1R5dS4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX8JR0ewg1EbFg
 zCVd0O2PH37vNHTZQePYh/NrQIvZRwJsN5cWhZMmQNIk0sMpPzBKwIxhYCIYCmHYK4i2nEc9yOY
 fnc5uJQgemzQNy33Rm4jCKha19M/t2E=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adb3482 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xyndvWGceNBv60aQF6QA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_031844_101848_BA41C03D 
X-CRM114-Status: GOOD (  14.55  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 15 Jul 2026 20:46:40 +0200, Andy Shevchenko wrote:
> This is the finilazation of the work announced in the commit 61e1fd2abca4
> ("gpiolib: legacy: Make sure we kill gpio_request_one() first"). With this
> small series we kill gpio_request_one() and leave only two legacy calls
> devm_gpio_request_one() and gpio_request(), where the managed one has only
> a few users and high chances to be killed soon as well.
> 
> The series is supposed to go via GPIO tree (due to nature of the last patch)
> with possible immutable branch for others. Please, ack.
> 
> [...]

Applied, thanks!

[1/7] ARM: pxa: spitz: Open code gpio_request_one()
      https://git.kernel.org/brgl/c/e4c5145a8c42b1ff8c36d209b265d65005fb2a8e
[2/7] media: em28xx: Split em28xx_pctv_290e_set_lna_gpio() helper
      https://git.kernel.org/brgl/c/aa6a84558231f61264bd09c8ef013c7bca63db1e
[3/7] media: em28xx: Open code gpio_request_one()
      https://git.kernel.org/brgl/c/492c8f997533acc550bc23be73b847f5e7bf3e75
[4/7] MIPS: BCM47XX: Open code gpio_request_one()
      https://git.kernel.org/brgl/c/878804621d798dc9eff6148732f74adbc45e99de
[5/7] MIPS: BCM63XX: Remove one time use ephy_reset_gpio_flags
      https://git.kernel.org/brgl/c/6eeba9dc60aa6a5e2a617c7e08a6ad4da325c1f9
[6/7] MIPS: BCM63XX: Open code gpio_request_one()
      https://git.kernel.org/brgl/c/1805476b1a49aea62787072b28d7a2d5880c53da
[7/7] gpiolib: Get rid of not used anymore gpio_request_one()
      https://git.kernel.org/brgl/c/dbc9f76c3ce301c76991574e1944a0d2a8717062

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

