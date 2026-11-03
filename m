Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2847B60850B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 09:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k1ZP4p7+;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zseL4HAJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UM0Bfw5qWLCibuKINiRXLguaJCuUziBZJgJ0xQf9uV4=; b=k1ZP4p7+rcrzM7
	pzEDMWsBQZ6WXVoTbW2cETW3qUBJ8tWcXIpdWU1A4jNA0Y1fz+B35YEtTpt8UzzbsS1v257WuTT9t
	ynXYx9lSMl/xToBc4PgEHl1JOfNAh1hl/FXwY6KZeyYSbJiBUfqX7OJupZPJlhvQf6zPzcSx3ZXBG
	iBRRHGLoNeiwW9Nig57DfS+w7T63BVuR2eZWm/lzQkWQdIGGLCn8ZuNnOrvLfa194rTbkNGJlM5bA
	tgcPNKaYZlsW9Jf+PbiqihvM38KDulrF3Ep5+KWhjaZD0aEMx5cbJXzvZXHQ+b8W2JXbiLBNLLd61
	r95w7myU8RPkrsOeP/yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBDU-00000001q0E-1PKr;
	Tue, 03 Nov 2026 09:54:08 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBDM-00000001puy-3PlW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 09:54:06 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1828469f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 01:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793699639; x=1794304439; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UM0Bfw5qWLCibuKINiRXLguaJCuUziBZJgJ0xQf9uV4=;
        b=zseL4HAJxUO2eBE2wNbsdpyAxWKsUAr95onn/hzm97bqq6eFPgxdI7s7WNimZraWDj
         sucBdmkDiKmR/3IUXLaEyaVlegjXd7O/eKlLraSxAGCCkIVKK1J564xTqNmOHC6O0VCz
         i75B6MbLZf7U8T1QX0ySIbms147TMmYdX/aJG9jsixBecviSOQFC0tlLkkrj3WVyNdPn
         n1OUie4E6ZpXCPtfmXXHBU7WLkJLQEFjpPLEESfy4GMAr10ifT+kXknFMrHobE/ALs6R
         i+4vL+oYs9zDAERO8P7L4CVjwphKEQZVdR98oF4G+QiVCktmjJsB0iMXHI8PVM+2UXR5
         aR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699639; x=1794304439;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UM0Bfw5qWLCibuKINiRXLguaJCuUziBZJgJ0xQf9uV4=;
        b=Fhp1IqTAr8eSgqNa1EpO2ZFDyl1jGOpDnNB10MF2YkGBJusYXTcUWQE5WPy67oAko/
         qHV9PI8ZbLz4APr5Uppn1vJSDH+njMBNG6eXmir7a9ch+ePNyzr/P3XWCWUVSn2xxb1M
         BE0gUJbVQ+83WrqxoEylnlCUjNziSzW0DLOUwzCiC/hlBrAKFoDsgDm0VPN2Ykg9Xvdx
         G3i/CVU35gNrWB24TNEzVDqkRVkf4MtvSF0K8SVhydv5GOsyD0MR3kLNYcRSnVQm8uwP
         X6K9ymmJyUCeImOLrTH2npK7RBNkGcSuoLveZHJcSjzCZwAlsXuCR9eA5YKxYK0p5xTJ
         +tdg==
X-Forwarded-Encrypted: i=1; AKwUvBwy5pxzY6M+U1pnHD/W23VXAocCJRWW5//GslZMjxG3cb2SM7LfGol7cJbpCrjdTZ/40bmNz+KUfwbZLl2rbSuj@lists.infradead.org
X-Gm-Message-State: APuU4Z9st8CmyEXro0NjPXx9y1/gwLr+AAbqSlknQDbRpOAMR1btHaIm
	gBrCe84XncuhmIf4Ohd/2RK0xZQNPJCgEPkixEudLhWehcccpzpF7Njewq8iEgZeob0XcUtvqwM
	4yNMJFss=
X-Gm-Gg: AYBFou10L+OC40cjodgOgl6Zaz1gsAX9EmL3zKpJvugfyc7SCyo7Ey/2t6YkSyNuSta
	WTEQqkLulebI/7mrkhMM4iSBbOipwd7rZwjGFC8uv07Q7iYAgdped2pm6incU0SU+J3pAgf16O1
	7GUPsH66S5d+KcEsgKvLODRX0Wdwe+4ILtMimZkMUiwGVfheOLbcY5dGAPaiQ5tnISE0I9XtZit
	G3euRyc/QiyizBienBPXb6+bQQSv8oc4FJAOKAdXHgS1LoU8x+GYd7qTWnXxYiox+S4lraQPISv
	r/6YZoWYYRP1kBYJLadH41N8O4Q+/PVtbDxvG8c2601TjvLDt3jqum7pFb6Lbv+hx33JtxlKRyc
	kH9O5N/2CPZkypVZ1hpSMDM7mcpszAQqpBVU/5PCjV//1BFeZRkzNpJKAt0hhl0ZbtGeRhN4NBW
	adePV4I48cIQ9CuyraVNw70OEwrRI7Tgup6kJC2cKMBkhcf3K+GOtH5GDYYRfLWW3TpGWF9L73l
	/WtZCC8NTEtzEnsVLYheqOQX45Y0ntKjc9Y8JUc8KSQyWrpHPPQx81qAbmJQl1L3oPnOhl+/GgA
	rOtNMLeAHvJQ8FtHCksVxEKcqHBtjiVqN8WIfLPdRUpwqjgf15sgPWtihNfsEVKPBYHxD60=
X-Received: by 2002:a05:6000:2211:b0:48e:62a9:1a65 with SMTP id ffacd0b85a97d-48e6e5161admr23618701f8f.49.1793699638798;
        Tue, 03 Nov 2026 01:53:58 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm24029915f8f.23.2026.11.03.01.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:53:58 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20261101232011.1172410-1-martin.blumenstingl@googlemail.com>
References: <20261101232011.1172410-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] arm: dts: meson8m2: add dwmac 3.70a compatible
Message-Id: <179369963832.2329937.7183164129825631720.b4-ty@b4>
Date: Tue, 03 Nov 2026 10:53:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_015403_349398_7F98DB9B 
X-CRM114-Status: GOOD (  11.42  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Mon, 02 Nov 2026 00:20:11 +0100, Martin Blumenstingl wrote:
> The Meson8m2 DWMAC reports User ID 0x10 and Synopsys ID 0x37,
> identifying it as a Synopsys DWMAC 3.70a core.
> 
> Add the "snps,dwmac-3.70a" compatible to match meson8b.dtsi.

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.5/arm-dt)

[1/1] arm: dts: meson8m2: add dwmac 3.70a compatible
      https://git.kernel.org/amlogic/c/88da0c14921c8def2775d5238ecaa5934e603da0

These changes has been applied on the intermediate git tree [1].

The v7.5/arm-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


