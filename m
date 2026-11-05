Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4C36082BFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=unEnFj4v;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hwf6we4k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6amY5D6rlAH4aaMfXl9jZY5MGkhAr21ewvoOis6OcXc=; b=unEnFj4vr+42AmU66d4NBdWkSm
	LLdY6m61n1GY5XTlnMuqc+dpOSb1zhrN4lhBx2AC/hGbw0kXJDl4S+zj4hoZS84S1aAEsUcYW1l7X
	E3/mae8G/Hl7/LMlFAWMkj11Lu14X05YtOMMEa8USs8DPgcu4Ind8uMswCVz18vCM1qJU4nMxhejV
	AXaszm63xvSAGpGc7+vz0nZIyroGs7K2WjNaIbhRcIbdp43TgedwwfjWowZX63mFh8aUFcInodfMB
	byi5/Vkj5Ex1W0oHxoBtztPsZsTDuaYsNxiLDu80J17ZYAELl/p6qJgkbIs8Bxffh80R29espisJs
	bWcC1+hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP114-00000009oUx-2yA8;
	Thu, 05 Nov 2026 17:12:46 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP111-00000009oSJ-2BLd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:12:44 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-3535a54bed9so2816231eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 09:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793898762; x=1794503562; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6amY5D6rlAH4aaMfXl9jZY5MGkhAr21ewvoOis6OcXc=;
        b=Hwf6we4kPMbfQQBAFinN042sxwKm6vfR2JIT+fznU9/VFK5ic6itW/uQxMjrPDu7YF
         5qPH2caaGSn0/fEIfsQ9nY+rlloUQRvfUFH/hiSymIxMQXS7luz02JDANhJDIU3T1TV/
         TU22pbN5PKyDQcvt5On3YclJFTqy+nM5FYTCaV/IzYShuwmFlfLil0NE8u9SIIDMtsxW
         g5Fi/tPfsqx2aIDDHZ/NCDyCysKD1YYmdKHrrTteKhIGUUyNGYN+TJv9gzE6YCKe3QnW
         yOtCl8ZR5ffQ9CN5BbjL7bmBnbo5qFM/RlGypbZXVAZfcJ+x/gHCccWhGV5ESotfs0l4
         hI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898762; x=1794503562;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6amY5D6rlAH4aaMfXl9jZY5MGkhAr21ewvoOis6OcXc=;
        b=uG5OeS9TBPRVLhlhykI5cy1yicHtn8hE2Z/Nu/zONdEP8EvTV4SwIy9LKoP+MxsWsH
         hEeGZFppX3m/nc8rJ0OUHS2CFTcXBsJPu1YtUwFt8ncQitYXPzIf2h+amGj1Tr7w5tQ+
         Fh5TR+tXWuA7F8ynWWZwhF2q3sGgA6ROoJBpEnqRcOhRY6wRZ/JSGe0nmSl2eB2NFeHZ
         ApFqI2OquI6CW+i8ahg2yNLdCCywsNRsaU7ANjok1Bck9TMMNge4jo48my9GwZ37pO1S
         pWGAaseULUmJDvM/KfpkHwIW+LLX+T8O5RHlNbmhiPtFjAA0UmfmRkHjkvgfgYC7f/9v
         fJ3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwCfu18MbWsW0zh2R0QOKKDEiwJu9BWDKL8XeDdl6pkohR6QsnwJfVaXp4HYrKfjokWuLnytFqgMjF06N39Rq4g@lists.infradead.org
X-Gm-Message-State: APuU4Z9CB7c2ZH1llWQ3Z9EZRTm851WXUQxtpJiPgyaQWYFXmHmb45oy
	IL9CpiA+7KAGcT8o1PkKQkdHL0avrZubSG8C8t7V96gJdHTyV3oDlEDr
X-Gm-Gg: AYBFou2ff3xKVHDows4HDJEtzh3vVmuzOZpILVfbAhjMFT/nsM2lHkKiIWwC02agXhF
	1xzISZR4y+wIj0CbG1N3O6L8zpuIjub/vaWupY/4oOqdn5s6JSnOpHCQXRarm+gM9C0Tl7a4+kj
	pKC9zP3tqdjRQ9725/oo+2tCfJfJKQq/8+WlX5xE3PDnNjshFl5v3wzt84SJfzJdW+OYdW9j27B
	czyLTTz/1QgK1p2G2RYpMvqRFOXzHTjUPCMKlZ4XUL5FHo0xSUhoC0oLaibKvCfXSqoomPR3TgG
	kisMSg54NdAXtFPg3/Ay83pWXIAXk4Suqn/HIYv2hLGB9E/qqzLh/+MTrMwJ4LsrP81sr+IjRyP
	Jw6TONw5NmvMoJaVwuleG/4ivfnTe1lRDwtUP15gABRBD/GOdfjpQ3isOnx9S7ir0SPkcTuOwhD
	PSnLHaqtf+tiBpcl/U+vxnrF6qN66oaTjdZKxF/oHIP9d/iEszBzTydVlOE+eL79TdmEsrdadjm
	8hU+0I/+gdfGQ7aAf0R0js2okBy1OvTxtn3Iz7JSOQxxuvJOYSdUzoFiYWjO5Op75KafAAj+7eU
	3VmPAQFv744b36EPwGQTAnmMl4cCYQjhUP9P/kWoMOPdbZbo3TQRlQRRez2VMxKchVnxDA==
X-Received: by 2002:a05:7300:dd09:b0:36e:370d:2127 with SMTP id 5a478bee46e88-36e370d264amr3168344eec.32.1793898762203;
        Thu, 05 Nov 2026 09:12:42 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6d3dsm22255325eec.7.2026.11.05.09.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:12:41 -0800 (PST)
Date: Thu, 5 Nov 2026 09:12:38 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Russell King <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC
 regulators
Message-ID: <auy4Qbxg-pW_X37E@google.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
 <20261104181429.GE1650678@google.com>
 <ad02069b0cdede7ae191e4a3df57f33a@gmail.com>
 <20261105085321.GG1650678@google.com>
 <85817548-28f8-45ed-987d-a4996c2bc4ce@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85817548-28f8-45ed-987d-a4996c2bc4ce@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_091243_626797_15701ECE 
X-CRM114-Status: GOOD (  17.04  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 02:43:17PM +0100, Arnd Bergmann wrote:
> 
> As far as I understand the situation, wm831x was used on the
> reference board (Samsung smdk6410, removed in 2019) in addition
> to crag6410 but never anywhere else upstream. The question
> then is whether we'll ever see a DT conversion of crag6410.
> This would require finding someone willing to actually do
> the work, and coming up with a way to handle the autodetection
> in mach-crag6410-module.c so the correct spi/i2c codec
> child devices are probed.

So I guess the question then: do we need to keep this board at all? Or
it is time for it to go the way of the dodo? And then we could drop some
more drivers as well.

My goal for the series was to move along legacy gpio API conversions, as
well as move away from the GPIO lookup tables (ideally I want them gone
now that we have software nodes supporting describing GPIOs).

Thanks.

-- 
Dmitry

