Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92405C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 14:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s27ne428wojOwsBAshie2tilJzFTOz/pVe8QIl0k2F0=; b=t7Y3xSBzF1SFDu5QV/LWrGA9v5
	HYkkbI971JFVOs+z7JO0AJOvU2H7gTPMMxRiNfCbc4ULPflWhq3WLWPLtcs1M+JFSk3NKOyuJDZiv
	+dGMJqX2admwzHv/w9xIuavNxMoGtWuGLAvp1YQ5aooQD4nj4yb2Ecr6OejvRyKqfZ2GfDRkrF5Nq
	XFb9rEdsX0SC/XgRAidNfT8pP4hUAGKYz+AHmSXDTjRx7ejbUc9kIu5eSpIAUdD4NAbbpzJekPODM
	3aTKJUhaLukvNtNjIhyrTG+cYZQBCNl8kwx+w2FO0iwhqjzf/wBC5do5IkhocUtrht+Vb+wtt3JWT
	3EzT1rFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsNQ0-00000008kc5-30cn;
	Wed, 12 Mar 2025 14:50:48 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsM2P-00000008YVp-2Nnm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 13:22:22 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2243803b776so125337095ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 06:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741785741; x=1742390541; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s27ne428wojOwsBAshie2tilJzFTOz/pVe8QIl0k2F0=;
        b=wNgFOn/SmsvIIdOQpr6byVW4N5hRGbpFYPIm7yrpCF7+yo6+JXUKLDyn9VvQ5CsuR+
         BTBT7IIRvgW/CUS4iSF+BFpTWkSIZJig62TTHQrL3WBPtpTYzdRJxr/hePjv+faFZHsK
         OquBxtLMn453xRJVyrDaRmmtLZqM6+WNd27/AgodyNbKjAzbn1nuDcWWfmL5pMN02rz0
         12jsBvE+mEYdLPa81PJPtnhlt7T2eo04uh9PH7G+LERuf0ubKrgbwB536u+1wX5tv1pi
         E6lu53mfJrXwumXi5K5eVuwqKO6LQb2t+VbP18RXAlsruTAdzikeFoLKxK0Z5aiafXvl
         t/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741785741; x=1742390541;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s27ne428wojOwsBAshie2tilJzFTOz/pVe8QIl0k2F0=;
        b=Uw+XkmJK6lcyfrqf843OyKnc8wJ2u8F8RTTAQwd48gG5bBgfgHtVOYu+VJImEzfNO2
         4dZ8rv3AMnCwuNICS97NeM6SuXL9B9fShrKVcjNiA1cvB7oNXzgmVcsmBIln6OCM9m5M
         r46MbmKQPZQqnPhDFHt+9O3wpnqzOb6j/nRPJEGxJsTQ2Pje4tOLidQjiIjhakxn5OeY
         w9thW4FUrWjx1Zq64/KVglj5Q2OeaXuwEx/aN1JdHrTMKUJB1W+SEsaDLJrBwX3FTGxZ
         OGFkKSwhOQx8pFY5f8KOTI0QU6lbH78ElIhW2yZDZYSJ1BqEo6YiyHie6EJeum2s/S1X
         ctqA==
X-Forwarded-Encrypted: i=1; AJvYcCXPipzT3D/VOVOkMrW19LXrFlMSyDoo6fq6sRfOdNjR8/AVHGmntyaT5VJ6uFumGas6bSY3XJrUz60H+eifJ8yo@lists.infradead.org
X-Gm-Message-State: AOJu0YxRH9fu07vSvl7ZPo2vDmQGWI9kYqhCnZgTQEOUGuVLXSQqwmnd
	8KVhckBlWrZUe2EmW3oHSk8FK7Twx/tNi2LtAN4va0B+GVV9b40pFBuJe7gWdcpkHW7J3S8N3sF
	w7t+2fVrk/O+IH2cWPMAE9U9btWHcXCixw8Gsug==
X-Gm-Gg: ASbGncvV7sgZdKX8+2h8SLkftN3AhGQAXsqUXmij/taPZJaGlygz3JOFkgHA2Ir8Iim
	+qUnNsQO+aa6ytbTNFT7DuEX6R5/yomwIldxtJ/FGyC3W1DdGJ1zGlIGrVy4fSiFW2OD9XK+ser
	kpuH5j04Ac9sZlCTRAHB2nEIu6skbXqPU6lZ6EnA==
X-Google-Smtp-Source: AGHT+IGmt/3UktMaOMFJgApftv3nZ067gpwV3LHvs4wr2QCvCVRTWlevRuRQpnJ3GdbEdKToZ/jiLjTzfEOKYcYZ6Lk=
X-Received: by 2002:a05:6a00:987:b0:736:4830:68a6 with SMTP id
 d2e1a72fcca58-736aa9b3cb0mr30689940b3a.4.1741785740656; Wed, 12 Mar 2025
 06:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250310090407.2069489-1-quic_jiegan@quicinc.com>
In-Reply-To: <20250310090407.2069489-1-quic_jiegan@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 12 Mar 2025 13:22:09 +0000
X-Gm-Features: AQ5f1JoVaTUjPnEeh2tsJVsCs5mqAeippvAwDr6IKbNgE69l9whq43Fk1D-kCtg
Message-ID: <CAJ9a7Vj=Ni_o94u1B+oouv0GD5DVmST=N31-hsN=SPSbaoqO_Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] coresight: ctcu: Enable byte-cntr function for TMC ETR
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Jinlong Mao <quic_jinlmao@quicinc.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_062221_613336_F6AF29D4 
X-CRM114-Status: GOOD (  33.62  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, 10 Mar 2025 at 09:05, Jie Gan <quic_jiegan@quicinc.com> wrote:
>
> From: Jie Gan <jie.gan@oss.qualcomm.com>
>
> The byte-cntr function provided by the CTCU device is used to transfer data
> from the ETR buffer to the userspace. An interrupt is tiggered if the data
> size exceeds the threshold set in the BYTECNTRVAL register. The interrupt
> handler counts the number of triggered interruptions and the read function
> will read the data from the ETR buffer if the IRQ count is greater than 0.
> Each successful read process will decrement the IRQ count by 1.
>
> The byte cntr function will start when the device node is opened for reading,
> and the IRQ count will reset when the byte cntr function has stopped. When
> the file node is opened, the w_offset of the ETR buffer will be read and
> stored in byte_cntr_data, serving as the original r_offset (indicating
> where reading starts) for the byte counter function.
>
> The work queue for the read operation will wake up once when ETR is stopped,
> ensuring that the remaining data in the ETR buffer has been flushed based on
> the w_offset read at the time of stopping.
>
> The following shell commands write threshold to BYTECNTRVAL registers.
>
> Only enable byte-cntr for ETR0:
> echo 0x10000 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val
>
> Enable byte-cntr for both ETR0 and ETR1(support both hex and decimal values):
> echo 0x10000 4096 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val
>
> Setting the BYTECNTRVAL registers to 0 disables the byte-cntr function.
> Disable byte-cntr for ETR0:
> echo 0 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val
>
> Disable byte-cntr for both ETR0 and ETR1:
> echo 0 0 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val
>
> There is a minimum threshold to prevent generating too many interrupts.
> The minimum threshold is 4096 bytes. The write process will fail if user try
> to set the BYTECNTRVAL registers to a value less than 4096 bytes(except
> for 0).
>
> Finally, the user can read data from the ETR buffer through the byte-cntr file
> nodes located under /dev, for example reads data from the ETR0 buffer:
> cat /dev/byte-cntr0
>
> Way to enable and start byte-cntr for ETR0:
> echo 0x10000 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val
> echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
> echo 1 > /sys/bus/coresight/devices/etm0/enable_source
> cat /dev/byte-cntr0
>

There is a significant issue with attempting to drain an ETR buffer
while it is live in the way you appear to be doing.

You have no way of knowing if the TMC hardware write pointer wraps and
overtakes the point where you are currently reading. This could cause
data corruption as TMC writes as you are reading, or contention for
the buffer that affects the TMC write.

Even if those two events do not occur, then the trace capture sequence
is corrupted.

Take a simple example - suppose we split the buffer into 4 blocks of
trace, which are filled by the ETR

buffer = 1, 2, 3, 4

Now you suppose you have read 1 & 2 into your userspace buffer / file.

file = 1, 2

If there is now some system event that prevents your userspace code
from running for a while, then it is possible that the ETR continues,
wraps and the buffer is now

buffer = 5, 6, 7, 4

Your next two reads will be 7, 4

file = 1, 2, 7, 4

This trace is now corrupt and will cause decode errors. There is no
way for the decoder to determine that the interface between blocks 2 &
7 is not correct. If you are fortunate then this issue will cause an
actual explicit decode error, if you are less fortunate then decode
will continue but in fact be inaccurate, with no obvious way to detect
the inaccuracy.

We encountered this problem early in the development of the perf data
collection. Even though perf was stopping the trace to copy the
hardware buffer, it would concatenate unrelated trace blocks into the
perf userspace buffer, which initially caused decoding errors. This is
now mitigated in perf by marking boundaries and recording indexes of
the boundaries, so the tool can reset the decoder at the start of non
contiguous blocks.

If you do not stop the TMC when draining the ETR buffer, you have no
way of determining if this has occurred.

Clearly using large buffers, split into smaller blocks can mitigate
the possibility of a wrap in this way - but never eliminate it,
especially given the extreme rate that trace data can be generated.

Regards

Mike


> Jie Gan (4):
>   coresight: tmc: Introduce new APIs to get the RWP offset of ETR buffer
>   dt-bindings: arm: Add an interrupt property for Coresight CTCU
>   coresight: ctcu: Enable byte-cntr for TMC ETR devices
>   arm64: dts: qcom: sa8775p: Add interrupts to CTCU device
>
>  .../bindings/arm/qcom,coresight-ctcu.yaml     |  17 +
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi         |   5 +
>  drivers/hwtracing/coresight/Makefile          |   2 +-
>  .../coresight/coresight-ctcu-byte-cntr.c      | 339 ++++++++++++++++++
>  .../hwtracing/coresight/coresight-ctcu-core.c |  96 ++++-
>  drivers/hwtracing/coresight/coresight-ctcu.h  |  59 ++-
>  .../hwtracing/coresight/coresight-tmc-etr.c   |  45 ++-
>  drivers/hwtracing/coresight/coresight-tmc.h   |   3 +
>  8 files changed, 556 insertions(+), 10 deletions(-)
>  create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
>
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

