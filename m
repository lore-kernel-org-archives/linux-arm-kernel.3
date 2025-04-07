Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34008C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 09:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g172mJCzRlzwf53qGkvLIRDbowmzXfpFnIIJlJG7WRw=; b=cN0Gk8qfc52e4PSzZdBqxOW2q8
	cFDsKYgsXj/KB6QslWmu11+iLuI/u2XS2IiDMs8zErUMy+n4B0HUzkzr/gBjx5oqnLspfCrwKNxJe
	hyszY8S+PRFhlGPivcpus3CQ5JuACLRwEgl2KYhBY4yk9gyAXPw92jQHRVlAazB3ibw8kwkLbD03q
	ulROPvaRnjLbIhcPkcBpNETvRVJUX2RY52TyvlCQN0oih4fA33i/DvDe8U97/sgPQRkNXybH7sG5L
	jzTVPNZcN7mm+SpGjEtZjD6xQqaWUwE/xStGQS9iElPSVo5D4fN833SHaBYfAtql4qWSd8cvoBJju
	J3osKTow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ixg-0000000HDtg-3Ip2;
	Mon, 07 Apr 2025 09:40:12 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1isr-0000000HDAA-1G1L;
	Mon, 07 Apr 2025 09:35:14 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-477296dce76so37063211cf.3;
        Mon, 07 Apr 2025 02:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744018512; x=1744623312; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g172mJCzRlzwf53qGkvLIRDbowmzXfpFnIIJlJG7WRw=;
        b=DZQLqpR/qJJVeXCpIuEF/r7GmjNmPjpx6qL1J0u7GQyizZ0Jwjzvj+USRDHRDHuG92
         6SukX3ljyQW1wAyW4V6itqqWKh6P2I1gYTUmTkBXJRoNL0azG+px61Ukod5oeKB/M6RF
         vFkLNtz/fWZvq6KbMKd+iLfXmxHmhxs7/I2aDUc35UgXymvtmqVWBmwZbQy1YD9M+Lf+
         p2+5afC0VM2AUwCs1kEKSC2SdICTtaiG5tQqcVrUhMupy7ib0i3POEd2meEh2ysocs7x
         CVSKLvtCjD1ImUVaDAPwCmnIIi0JGxGevhiqCFuvB/XRWv7KVTr3kzRp0lhYKLKipJuq
         jM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744018512; x=1744623312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g172mJCzRlzwf53qGkvLIRDbowmzXfpFnIIJlJG7WRw=;
        b=WXfe2g0PFNNqWtutJQiE8x0Y+BGCG0BxlT8E3hg2PBuEXXZFm0IYLV1ZhLnk6j0Pkk
         mZvWiUvBlHFAG+DTb3d+CZo8hVzaPDH2UbqmqHBGnI9Qx+wGMAY8UWjhQGSK/Mi9gpF9
         DLYAb01ArhhYPi+5Uu4Cnb3fkOrHBkXT6cygAzbIRmAPSk4RXLhs9HzULJK1WtMUyzW0
         w9wVOvh+9zr3gzoX51xiDhdED8WJeBzCDVLB4cjo2iaVxrFY+y5vNozv80okHnmWHX0W
         jQ5gpKbakcW9FFxcHQ0xTq8Dmq/20T4SgJUApZbcbA1aNt7SNk91DbUYmGDVypsoXb54
         g9YA==
X-Forwarded-Encrypted: i=1; AJvYcCVPNYb7OLHK6UZPHHBm3jPzxDLfYRyMC/aCfa9FP9/CkD4WKpaByT7058l44rW7wIwJZC4RHXKtgUjhrdRR4xc1@lists.infradead.org, AJvYcCWfsnQ1w+MkzEbdKn1ITrEcqarXAXnJSI8uYcEff0abCW7dxgteQvj8Q8cVGn/C+/p8XKH8JA8sRBvu@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh4uSq7LRu78Wwk0zPAH7aGsNMqjPqe7vIw7hXXtaM2uJmizz2
	TjZvn/pxMLo/4c5kzrmNjwbkV2rN74HSBkmHYmVDrXcXRfyJHxA935kPZHLRceb4pQOInuIoGZR
	uUEmO091Od02ijjn9wJzGNrh6Py8=
X-Gm-Gg: ASbGncuVZ9FN4h1VtdUWPpVmaf0h3NtYj0dIBxP5ZGoGlxbUmVmWYQYCQNRq0vLV6Ku
	4mwepTM06Dp5o8Br6kFbuOF7XFBA8XIczIr7f9xx3A/tNK637UveYsmUo4GKS9Q74aKPpUqj10A
	wuo2HC92CvznpF/ETyXobYaDp8Xw==
X-Google-Smtp-Source: AGHT+IGhTrrSc6uVMmD7MMBQ7qTCrg2uDZuofOTM4+WVDylk/fH4UUQjWOWK0q8EfUy00jeuyFyYxrPKBAte+ZhzSKQ=
X-Received: by 2002:a05:622a:1a0d:b0:476:8ee8:d8a2 with SMTP id
 d75a77b69052e-47930f77cecmr118271881cf.4.1744018511946; Mon, 07 Apr 2025
 02:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250329190712.858349-1-martin.blumenstingl@googlemail.com> <20250329190712.858349-3-martin.blumenstingl@googlemail.com>
In-Reply-To: <20250329190712.858349-3-martin.blumenstingl@googlemail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 7 Apr 2025 15:04:49 +0530
X-Gm-Features: ATxdqUFGuroWUppSQpVAV3779ZjDlCQcJ6dl21DBRUh7mRzwMlpd85_9x7QbSys
Message-ID: <CANAwSgS5rpR6mbE0tHqx3Q8_KjOo3F3nAKQhAdxzOLvQ8-sk5g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] phy: amlogic: meson8b-usb2: Use the
 regmap_{clear,set}_bits helpers
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kishon@kernel.org, vkoul@kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_023513_335472_45714B76 
X-CRM114-Status: UNSURE (   7.86  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Martin,

On Sun, 30 Mar 2025 at 00:48, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> These require less code, reduce the chance of typos and overall make the
> intent clearer. No functional changes.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
Reviewed-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand

