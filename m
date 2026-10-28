Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045AF606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 09:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kn+ZfL2N;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H09EHqdS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NR8gKvzZM739OlJnXa+9g1824BNxWUNsEDlub78+UpE=; b=Kn+ZfL2NiiCh38
	D5L5CTth8HwCjFxPbxogop0Jo34N6VzTZ0TENpQEmEwsEFcXmWHuBaIgvsaL5pWKbRvrl+6ykwyP9
	IgPsBndYgGRWVEsfhdO79nN5B0c9vQCySi5X/Iz3LXzJK/uUsKiVGWKOF6CKDawlN2MHrwT+fviY1
	OQi7Qzr+UJFcZi3v9F1XC5X4HZSPd6e5SB1xF7xJJl12i7bWAJone1w4yrIxblF1tb8twqcsxEPq+
	YzCq4umbivVxv17kUJQCwk18wZpYhB1Lci2I6oWergV0RmJ6jELFMuQbg2kaETKSotyNt05eC2hpa
	SJf7GFEKQzPN3+/3/duQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLzYA-00000006c4M-1Sx4;
	Wed, 28 Oct 2026 09:02:26 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLzY8-00000006c40-0Sdr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 09:02:25 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8a06454116eso399401b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 02:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793178143; x=1793782943; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NR8gKvzZM739OlJnXa+9g1824BNxWUNsEDlub78+UpE=;
        b=H09EHqdSAWz++ZgFyKDXJ2eqhtBbOqy34ejjXm9NYT8Njo7ofuy9RoH4fnlGpbfmjM
         +lDklVEOZswN3Xy0Z5aK/meoQ5o+yyR8TbZtg5xS9cdOy54hMQXBLMeC0VLuAVjc7qzX
         t/Bnt0mu3SpS+eTAXszPUDW5Bg2j11sb6yji1K60yQqddbP6lxdPEcnmegl8Cx8E8X5G
         rtZqWoMtFJsU7DUwmgKXnQrSII/oO5aASc1DXz923/oIVsJqsJG2AeL6pLA+Ok77Enfq
         OgBeeTGOwuNSec1vSRjhr64fEGaAnilrf3UuOlgpy2oURHzg1dVUXh+l2Sf33pP86YjQ
         A5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793178143; x=1793782943;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NR8gKvzZM739OlJnXa+9g1824BNxWUNsEDlub78+UpE=;
        b=k3xLmWacgshAQmsccG54ovxDbNDdpmaQr2XdOMrO+KHsgCU1EhJar8v6xujMWaq0U7
         e7tZzc+f8eYAOD2mHkWBkGtK46dba4Fu9KItV8DON47BwG1LaQSv22xXlvcwWNnY0FPo
         QzV4rxI4WkfNGaeuYOcQXWcrWw3I6Ypb1lF1Z4Jw8OAQr0svNpV/iRvYPDBZY3w+nkBz
         7Z0kb36JElmkzHZDMMGysnGFgSL1WSUn/yMLEgIK/3MEssq1Cr0swDGBu/rhAD8nZD7T
         s1eoXaEKcjJXp5YGWXuR4sSgX/c//AnPrnZACM6Xj/8Lfsgy9fpsxQWKtbxoagCk5a+M
         YHuw==
X-Forwarded-Encrypted: i=1; AKwUvByRXecnQqIqh2hM09I05DWa3A8NslAyAbajTGwtaYIkZ2vAMhMiPOKISDDVO06KfI5oLDIiRPrOz1/oUOytmY6R@lists.infradead.org
X-Gm-Message-State: AFq9FYJOe0L9j6H8tVxRN9Mk0YX3oUwmyggoUP7LW2dyae+NepClz5MI
	AsenZ+wpHb4wx/nux4YsLJWqSD/9PhWudroxGGe+QO+I3lq7MmglZJBx
X-Gm-Gg: AYBFou2qVHftu7iWs5YdlULOvNR4q/aaT9T30J0+qLKRQTb6sZ3N8im3cxP6h2FFZUw
	EjY4DD1dY0fx6TUArPgEiePxljTIx8SujVfqWF+kFTxd/0OLDXZ9bEKV1/TacM0+cikdh76m04+
	RocJp+skhA1vAXqbcQguTWRVhlT6mn/tlW9rJ5faJygZIwJJL0uf/mf1AwAPjuYJWABZCulVrF1
	0/MqIfY9j6BKgNEHlN19ggrmYgfX+wZ+yD+3tiTtvOg6GIQlY4HOC+QK5L5mCawN5pmyoh43L0a
	8D/fUV+R3Z0AOXKxDV4E/oSA9LewjUcnGHmxLYZcsjhVOdT2sY2ljdG97O0Eq5LnkynxheJJZNs
	OJ10+88SqwN7v26N6+cmVyEdeLNVEr8+j71GCQ9WVhJZ3BM3txVKkpH25CtM10cGsB0ihwReYAf
	h0ce3vCg0AoBFX8UCMM/LppXnC8otdAogCzVf18MgvA4ByI9mCjZJmAHoaO5P0Et/eU9Dcffz/j
	U05KXvRIBU0ZdZ7snRrer+YFQIsQfiAk4F53ISrp0uMr+DN/+UFrBQNuJoRGVEZyspOF5Mil27Q
	SOmYjBmPJ8ENKTwBZD9YOWYItcHxnPNJgUnYOg3ohrIm+PCB
X-Received: by 2002:a05:6a20:9e48:b0:3dd:a195:dd55 with SMTP id adf61e73a8af0-3e9023e52c4mr1537814637.55.1793178142953;
        Wed, 28 Oct 2026 02:02:22 -0700 (PDT)
Received: from [10.25.164.32] ([128.77.72.132])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc21274sm3790062a12.8.2026.10.28.02.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:02:22 -0700 (PDT)
Message-ID: <116227fa-96ed-494f-805d-ff54aeef545c@gmail.com>
Date: Wed, 28 Oct 2026 17:02:12 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: imx952-frdm: support AONMIX MQS
To: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261028031608.4155958-1-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20261028031608.4155958-1-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_020224_157977_49F0E140 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/28/2026 11:16 AM, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> Add support for AONMIX MQS (i.e. MQS1).
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> Changes in v2:
> - remove the duplicate properties with dtsi for mqs1 node

Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu


