Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EE0606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 10:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hawxdLMF;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OhntgV04;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U7T4zwyM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GcPKgaoCuNaXXKfK7YHbVbvTQ8K5JkvfLVdxqmyckTc=; b=hawxdLMF1wAov9+I0K6ILPRFDe
	USEqHY73srb94VZnU/bD/qmEEL0bZFVYGPpqj0a7KtI/K7la3T9jSRx3z/Z9PEFNZw8jkKK2ErCtY
	U7siBeLJltdkrsLWLlLISOACJC1ptrgzp0Mxe+QwLF+wDW946L4IbKshQy5sZ3W/vdvZiPnTmb8HI
	sJVaESxnRrwYsXdNph+2J6clHLtXZWOJaaBknnbooQL4cd0ZKvru2gCIF9qd2w7SJtMBNJ+VDExj7
	xAruJY2wOBbbgzl5EGizCi+X3Dja/KDOKr2ga32lR325hitwhTVcucOO+4W9F7opKcFEfmJyhPwli
	6t5B+3+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNJF-00000008yfG-1met;
	Thu, 29 Oct 2026 10:24:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNJ8-00000008ycn-3InN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 10:24:32 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vFbq3765983
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 10:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GcPKgaoCuNaXXKfK7YHbVbvT
	Q8K5JkvfLVdxqmyckTc=; b=OhntgV04JxTQ40rWyj5d2xZa7/6KHd5OJ6xHoU6H
	q3j5Z9X+YprB6mNk4SZ67s0eBct7rQJBF1geRSaXc/73dkP9z+SzEy6t8KOAhuH1
	r79VMzerhOJ/uJw4sI9xav+XuYdzAZi5NiwPch5lm8aDee8ghX90uYGxrgR8Ozy5
	1hjOMjEgP5deK2FIFH8OQjNOxvl5LlvrvKoO7z4IllkQ6bgQ/VIMKMdUrd11hPbo
	orkQuQs/1phdJYmIuW5GC19SUfQYaWZTb3jjfsUtXQyEwync+LIXT69OORa6UYX9
	mbn4kDS39NMOY//FSnO/4359DWFRkBnk2E9RmInl7JgSNQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgpu4gn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 10:24:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so347097885a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 03:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793269469; x=1793874269; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GcPKgaoCuNaXXKfK7YHbVbvTQ8K5JkvfLVdxqmyckTc=;
        b=U7T4zwyMX5wQ8w7x9R9HyLn/CzrhzSvYeGJkLIdEXHp37P1JNoFvXz1o8iAPq7Wc5a
         jSd5pFglAzVxfUVO2yuMsadnHlRmGGtO46/zM+LpOeiaEH0t5+KcU523W9CzQ6zvQqGR
         oBW9iiIa6+TSpt0zU9+hLy7biEHji0i7aM8ishC/tpKTuy5IoLXfeCTl4fDIaB5UUTRE
         XFLwznz5YUwN6Jne4NKvLNuFAEUQbNVt9nS5hPR3CrVqDA3MhLlrd2jqsbSIg30MnY5g
         bIPJW/0A+h+401VX+a669qXnDUol8h/bToFse//OvlZQBPHOxYIkHw7Wwv7rghGQwmAV
         yoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269469; x=1793874269;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcPKgaoCuNaXXKfK7YHbVbvTQ8K5JkvfLVdxqmyckTc=;
        b=t7Oj9IToCq2CqJTDco8P4+1o4HM99dINjHPAyyofW/tKpPaOFi5Ub/E5u6QuUpGU0Q
         /q550RCy9m1q3w9urJWdmYuGGU+uKjwG22omrC+RB7bqve2TNCwG1sAlLgZi8yXwKUSr
         Cq9fSX10/Q+HsU4mJJ+28ju5qbqPtpRTkQ555IchAzXwFL7wRR/pgp5/yAhjrBYds1Zu
         ZFOXn5KCydl7NnXrOnd99FCq21rSyDTaoSr1RwZrP7RUr39ksPBasHIL59Sa3laHPts2
         0cg3CWjgBVhF91MI0japRydJ/HyJzjUl9K78eltQbteRcvJPebCQlxAEBFNi/GQfSbyI
         WGkA==
X-Forwarded-Encrypted: i=1; AKwUvBzkZQfPG+0y7LecdUoCoaEKNSnRz1XcwY33wI7DoaCV5Ywu4vXNOrKQSsM256HX39noWNwcQzHkHpLBViyMU+qM@lists.infradead.org
X-Gm-Message-State: AFq9FYJlQndt+MPpiKH7Ig+DX00f4Z7RZP7yaYmjen9pA/qDGspGXK6X
	Dk/tDB+oFCKbGaRWCtIVQZLxZsMCjoQIGmlIwm9N+NwqWCJVsmxR+VwY1aSmMJp4ICARp3lVtJp
	Kl9OMds0hbD2O5+qZJxHMGVLy1xPMnRnQq70NeUx11D3hbcLRiWWoVxgZTbf+TF6wBGTKYqdO4y
	Bj+g==
X-Gm-Gg: AYBFou1G/46nDOo7G7ECLkYkg5m6Ckj8pqqX1ecWIGsaoT/im0AkxE7jVFCkH/RzXFc
	qSZXaggOzYfql1vhxxNIEnXyPSSvknHa7RS1scjK28V5jGkB6AtU9tHxX+F9P9sefFQOroaWgLs
	usQn7bpUIhR0AuyvZHL7O71X2Hf+/gfEO2YuaD35DWWlalnSOwIBvGpvke5YYXeXqCFGu086E6e
	8gatUV/xH9AOMNP7MnW8YCtzkKwkCJtVgqjy135EcRnQhP49MB2Ea7kdDsnr0IE8OHc7pftNSFA
	Em68jRSwCEbSEtoFuRjX/DKzd6LviOyFzZ40q4DmHtxH3r8EW2r+Xu+MvQvtTFUz5aW1aoYTpHw
	ZbYYopSwFr2wFM3ZQYZbGVoBLoAlBkoFqPiZdlLIoniDvsE/xtL71l60JC4cOdX28
X-Received: by 2002:a05:620a:400e:b0:942:a42a:78a2 with SMTP id af79cd13be357-94408a8cae4mr713122085a.31.1793269468983;
        Thu, 29 Oct 2026 03:24:28 -0700 (PDT)
X-Received: by 2002:a05:620a:400e:b0:942:a42a:78a2 with SMTP id af79cd13be357-94408a8cae4mr713118085a.31.1793269468363;
        Thu, 29 Oct 2026 03:24:28 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm33998692f8f.38.2026.10.29.03.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:24:27 -0700 (PDT)
Date: Thu, 29 Oct 2026 12:24:25 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
Subject: Re: [PATCH v27 10/10] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
Message-ID: <25q4hk2nu5nd4udoof4tsslyktdned4bygrgyzuknhvvvh2stt@a67p3qh6ddch>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
 <20261029-arm-psci-system_reset2-vendor-reboots-v27-10-fa4b3ff1359b@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-10-fa4b3ff1359b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfX49g/vNKiQyR8
 yA79/Rc4OOJwzVskQfO/Kp5Y8PNF7BF6gka+L4mi8nbdmdK68Fg7aGsNQeM2fmzoR/Albib9cir
 V7s4RHN0Mtnz0gtIEqy2FVMf+fpJwX3wTlReaSme13Pb7rO3T3/5LvUuM2HJ5aR+NW5phZlrrp1
 /sBLvmH8aAbNWd1XGfN8kMqwIRp/L82QL2udQu2Kv1IBWFKMCJJ4g5bf2ge587YLrkPy0Ew3pcm
 K+V8niY/SkVogh2bp3+3TCQll3pM5Y2hGMJnMqz7LsAKIR6qPaJwdI/h9/jNsdv5cCZ/5idrS8B
 FnSNNP7KTWDWWbg6fPFSJWz4akfZ54UeY1EYGAuOC3J2xzQcD+29kVY1sPTbdBU39Lm5Qq0iogZ
 YKGNpCu/0Ltrw5LrVwncBKNJaL3j4PwwsZ8dTPnzyHgWjOp5ohHTa1pLL8FWMGjbdonE8vVfsUI
 VF4Cj+EuUGn5bvg8WPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfXywQuF6jZbE5l
 nBZZUsUYeXzAH4LjlwEjN5hCqcLVAjtmcwVP5V3Ke0GlCTJynro3W1Svu+2X7YqUvZSispKpbzC
 L5HzgRg4+ZbtmknlZV41N4y2dYK5H4k=
X-Proofpoint-ORIG-GUID: r86z_1V209oQ26evPTQNnAgadXcX3he6
X-Proofpoint-GUID: r86z_1V209oQ26evPTQNnAgadXcX3he6
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae31edd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=1QY0aOnFgCSDOgRkrtMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_032430_941295_25CC892E 
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26-10-29 14:31:04, Shivendra Pratap wrote:
> Add PSCI SYSTEM_RESET2 reboot-modes for qcs615-ride, for use by the
> psci-reboot-mode driver.
> 
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via the
>   Firehose protocol.
> 
>   Support for these modes is firmware dependent.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Song Xue <quic_songxue@quicinc.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

