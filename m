Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CECC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 16:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vs8I+lQbhXJSC2p7kSiOIoyyP7z0JbteKnk86kksIsI=; b=i891A62mEvORdsHhOIjlBFgUiE
	ejHnx5EXTj8ktc70mtp34Ue+hFzNGe3fzS2uJ4HI94oilJjIBAh7YLmA7GxOJLWVpK122IsCLSsaN
	a8ODmAfLWCh5PYZD/e8FTq9gJx+B8xeyPI3EI76FPE+VwGAIS476C7ffEJ8wVLRkViqlHaRPeH8aD
	u+M1d76khZJC6FUa5scWM/Bi2RcfheMuoHu6Umurxg//RP9W+c0oJT1RmeZ21JbytgMQP1AApM2ZK
	TGs+cBnS/UA2hTuRktfyF6URvLun0A1/FYBANYqnp2GJym9fXzqzlQPU4vKSDrdngzKbxPbHwCDyT
	0IcrzDeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOf5Z-00000004cqP-1VMo;
	Mon, 09 Jun 2025 16:11:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOeNo-00000004WGG-18N8
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 09 Jun 2025 15:25:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Vs8I+lQbhXJSC2p7kSiOIoyyP7z0JbteKnk86kksIsI=; b=Q41DTfXB0gOrCpc8HdiYT/c4gi
	eEHXpSxD2FXE68Aplsp2+pJq38aZmS4EsL8F8bLw2sZdXrJIKgq256tnAhJJqc5EF10XI+zUaRSy+
	b1TFvc+vQMZl0ISnzAYMHUOf2zTCEVQHDCgglOUMXH1vWoXX7aryPMBX9SQcThL0FPf4Lvnx1KkNm
	kpkBv2A1tFaUf5YCDNdWWdBXzOUa10qNqYGsIhsy690bD6JExfMuyIvN3LoN92OZXHD2RaruYO53R
	uSPFgTrHjqZk0we9mF8NWHK84r6LckRTTWRhHoBBOkLFJVvbhjmPA/QlfGrCxrejpl3PsgnUFYniU
	zy9BzCSQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOeNm-00000001dWR-088J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 15:25:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AED3F4AB1B;
	Mon,  9 Jun 2025 15:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6249C4CEF0;
	Mon,  9 Jun 2025 15:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749482748;
	bh=0XvmPjJQR7GdmY8bifJX+/OPNAGchVnpSVOg0Ynw/hw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VB2Alc9h9ofvFautWvVGr6zhs5wI0pxCMwa6FjC5Y3B6nylibkae4ycfmzYsXhHds
	 U0iYgT1scDPsJyzQBo07wF0CwDFILV0VqoNwveCiY1PyOJ0K3fDBMjQc52J+ocieRl
	 r7hk3WcIe8ykftcu2ym1nrj2iG4C18X0Swrppz/zLCvaEErZGB13D2D8gEdwKdmqRC
	 EfYojwVaIgGPlWEwt1Toj4IXb5VMYj+s457idHX6SINIv+B7k69czsnHBye/Is0+Kt
	 f7eXrsaThIxdbVUVQQx/5UbTZmsnvLbljSTNRiYYjfDhTF8KT8p3SJx/HL7MvSY7tL
	 Gmdg+7R/LcIjw==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 09 Jun 2025 16:25:31 +0100
Subject: [PATCH v2 1/3] kselftest/arm64: Fix check for setting new VLs in
 sve-ptrace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-kselftest-arm64-ssve-fixups-v2-1-998fcfa6f240@kernel.org>
References: <20250609-kselftest-arm64-ssve-fixups-v2-0-998fcfa6f240@kernel.org>
In-Reply-To: <20250609-kselftest-arm64-ssve-fixups-v2-0-998fcfa6f240@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Dev Jain <dev.jain@arm.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1087; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0XvmPjJQR7GdmY8bifJX+/OPNAGchVnpSVOg0Ynw/hw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoRvz1HvFjZh0TWsWq/B3VR/96WBUHgp5g7DOSqW7j
 vgL1a3CJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaEb89QAKCRAk1otyXVSH0LFiB/
 9iVdf+kZHuwxlWLaxeChwbE/CWPxsCDOdrC0r3jrlPTpw+QYcGf957Fr6y2kblsgHNqJr5L71g8HQS
 41Aj+qaGKzHE7D9pCOkmqv4qb/r8lQ/77cQa58l8patM7tozVojjwb8Jix/3Z+8dme+sHL87XqkUyM
 N0JSpqOFV2nehDAD8MnW0oA5gAbdGH+bDbYm9jUugPgefL2ZcMWpRvPYXfmHe1m63fb36jvsbWfyCW
 ekQXmDZ2ydKgdX3SmN8d+4AGY4S3tbLgw4UPJNemvj+fd8uZam3BdKZR/mrPh/cf1vWUele5gZQe1J
 78NVkcLheymTr/C9YWez5hZ/HtKkY8
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_162554_296876_BA55F575 
X-CRM114-Status: GOOD (  10.96  )
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

The check that the new vector length we set was the expected one was typoed
to an assignment statement which for some reason the compilers didn't spot,
most likely due to the macros involved.

Fixes: a1d7111257cd ("selftests: arm64: More comprehensively test the SVE ptrace interface")
Acked-by: Mark Rutland <mark.rutland@arm.com>
Acked-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/sve-ptrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/fp/sve-ptrace.c b/tools/testing/selftests/arm64/fp/sve-ptrace.c
index 577b6e05e860..c499d5789dd5 100644
--- a/tools/testing/selftests/arm64/fp/sve-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/sve-ptrace.c
@@ -253,7 +253,7 @@ static void ptrace_set_get_vl(pid_t child, const struct vec_type *type,
 		return;
 	}
 
-	ksft_test_result(new_sve->vl = prctl_vl, "Set %s VL %u\n",
+	ksft_test_result(new_sve->vl == prctl_vl, "Set %s VL %u\n",
 			 type->name, vl);
 
 	free(new_sve);

-- 
2.39.5


