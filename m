Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C038D606A328
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=haTHSOWZ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qNmfZjbh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rehtB/RJWCoBYXPyJu0f7lT3D0OaoNNCjHdpBYFEC34=; b=haTHSOWZwKFeaz
	Sr4h32euiPl6B3RkHn982erh0RrZtDT/ZUmAoxNw2bQF/1iwliXPY7JpBZarm+Z2nZkT2XubrvEw4
	NKREb6p1iV214crueyr+MkTCh/EW72ZrDw5TSZtT0ipRHz7+SK6mt71IFBpx3G7/wsnUruZTN+uqa
	8QGo+bnVp7WAJfbIq5WVVbYoxv6c6qbxi1neWU9EJy7xwhGDBSn9PSMDuPHY/+6dmb02jDYmA7oM6
	/AkjWOixpqwHHKbmNru7cf+eqCIbB6k4ChNx5dDJxXItXj0Ut6/U/husBuEcYEUSkEna8htP4VPr9
	W1xCUNWHzx6Fb1HDy0Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOE7H-00000002Riy-0pNs;
	Tue, 03 Nov 2026 12:59:55 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOE7E-00000002RiC-06me
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 12:59:53 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-67be5d0e9cbso93930d50.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 04:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793710790; x=1794315590; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rehtB/RJWCoBYXPyJu0f7lT3D0OaoNNCjHdpBYFEC34=;
        b=qNmfZjbhwavdtgfMJpP/wtFqpzh0tKh+1wFAxeOwBbcqILpGH0E9BnPPudNmK5UO5B
         yy4EbSLLqycc8k2sUUjf6AX306lEwVMNtghu34gGAawPE1wElYfKCiukeLkFj8cXbJDJ
         7FcD7TwzRcjU9iWWG5fPXuqXbN8SVNgKPNfB1t5eUE4PfIhYA3St9piWOKi7c6pXL0ZW
         U6yBqUSbcz9KvC2z4cZedxFYxpMfawVndjT+cxo3XB4U3p4VtIsKF0ChLfeZ/zgTDpFQ
         CBsWwGLWonU55VOa15Mxw7XLcl7Uw5wLkuEbdtqPNJ53qkUSZxhvftgfbuf7YwW3ekW6
         JmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710790; x=1794315590;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rehtB/RJWCoBYXPyJu0f7lT3D0OaoNNCjHdpBYFEC34=;
        b=PazzfqxTsWC29CpZwYgNWqZC/kEs/kKkvprBSZ9hl7InAGy3p4LOSi83enf/u4ZYeR
         icl2OTnlcKhjWFLDxXAp9KJambXYstDKMpOxZ0WzObLupljmaJA1XjL4ruP67T4jl0LJ
         gwvw3Ys3GG3gddMgC0LrU854BKPUYXOKMWD+q1fyJAwkLo83L4EuYTbiLIJbfCwE9XJV
         G/e+X5A7dZ0wPgOLW8KSg76Ph6aoX97+zgAjXUzuxHSYbpkXrGjo7QiRUM42WsoNtJby
         bwKRWHPUZ0Jdbtuejrhw97J4IdTUxsNIG5CiPyChAoEwoTrdYJFi3Cu99LiYApDRb6nV
         SEzA==
X-Forwarded-Encrypted: i=1; AKwUvBzXoLf7zBqmsh0iJmXgbsqNBRe4cn68lUMncKx5OpZtqKzSi941Sko7F2XuXESZSNWW2Wy9iTic8w0PxpGfW97K@lists.infradead.org
X-Gm-Message-State: APuU4Z9ZgI+sBRPQMQ67Gre/c7w/fRW8d2Bii7CpbI32OG+C+/SmsZYy
	zkfE+dqPcb8bByNlW9KQo6qT3Z8wwTa0t654KbO4fhFKUtUny/qJi5eu
X-Gm-Gg: AYBFou04mraTlthDgTfUmfs651bMYR0WzutH8s5PUCrBTp5IXwdH0tEoEv8Qd8wWW8O
	Qe/hjAn/68W1HyI7S7Ne7FwgYDSDPxLB/TSxrJaQZRjDvKqaDQ63VcGD+AUlBBLUrcjMPh2mYYP
	biC27Amx72zeeYriqQ445iSuevWTOwDq4YdMuWWQjbQDfMAsowXvwux+K8vMez+n0j2iOIpmQ8l
	8mVZbPSCuuVttzHADt96uK1rtWA2BzNQnWsy9OXbLdSWxgJk4CPBLL/R0Z47Oyn3rsyRVhVARhh
	J6xTqA3C4M1hbxAptBFIkS2s0joBfvJ9JTQrMR+6iDGX9XDXGYNfFmYP/6vZbhJAHsVS74egAgH
	cepyiyN/ZCbDIWtmWg8/bJzcRwwci1yMtU1FRx2E1G7MtZkP6f27UkuZffrwB5m2d2U6hNbux8S
	5VlWIWsbJyzI76H/PHJtzE32SGa2ujc4Skappqd3wIZOMJyxonPReZvLBi7IVwI8e62dxTqljN5
	1ayEKBbCK5FO0d2QeI/wdjX1+5eaJGSfGPwRafp6jnOjRJ+9vHrHmSjiCycoM6CtBOeL86nSzAp
	DVOUnRctcPlNVur5dGq3b+Zf3397lGNGnE0BiuEpoHERYEScnynPz1JihGtcVOXLCTng4bsHbck
	pxN8mhNug35G8LIkNNbXS43RSvFMqBRuy2it3
X-Received: by 2002:a05:690e:d8a:b0:679:9b4c:5b95 with SMTP id 956f58d0204a3-67ba5049d99mr6926082d50.97.1793710790484;
        Tue, 03 Nov 2026 04:59:50 -0800 (PST)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b6d3ba5bsm70882847b3.0.2026.11.03.04.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:59:49 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Pablo Mazzini <pmazzini@gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: preserve A733 firmware voltage modes
Date: Tue,  3 Nov 2026 09:59:36 -0300
Message-ID: <20261103125936.156701-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031020640-263f7b05-a7s-pinctrl@gmail.com>
References: <20261031020640-263f7b05-a7s-pinctrl@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_045952_070949_BF2CE624 
X-CRM114-Status: GOOD (  10.06  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Enzo,

I tested your patch on a Radxa Cubie A7Z (A733, 1 GiB LPDDR4), running
Linux 7.3-rc6 with our local A733 patch stack and SPL/TF-A/U-Boot,
without the vendor boot0. It's not your exact base, and a733.c applied
with a context adjustment (same change).

On 10/30/26 22:26, Enzo Adriano wrote:
> This preserves firmware voltage modes when explicit bank supplies are
> requested.

Three warm boots with your patch and one with our local A733 pinctrl
patches as control. In all four the main PIO and R-PIO voltage mode
registers were the same from U-Boot through Linux, also after the
unused regulator cleanup. SD card reads and USB1 Wi-Fi (with R-PIO
GPIOs) worked, and the R-I2C0 bus is there. The control produced the
same results, so this validates no regression on my setup rather than
demonstrating a before/after fix.

One detail: our DT had no vcc-pl-supply and vcc-pm-supply, so the dummy
regulator reports 0 V and the R-PIO path isn't exercised at all. I
added both (3.3 V) to the DT in memory for the test. PF already had its
supply.

I did not test cold boot, 1.8 V switching or A523.

Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Cubie A7Z

Thanks,
Vinicius

